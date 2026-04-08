import cv2
import numpy as np
import pickle

# === ÎNCARCĂ MATRICEA CAMEREI ȘI COEFICIENTII DE DISTORSIUNE ===
with open("cameraMatrix.pkl", "rb") as f:
    camera_matrix = pickle.load(f)

with open("dist.pkl", "rb") as f:
    dist_coeffs = pickle.load(f)

# === Alege dicționarul ArUco ===
aruco_dict = cv2.aruco.getPredefinedDictionary(cv2.aruco.DICT_4X4_50)

# Parametrii detectorului
parameters = cv2.aruco.DetectorParameters()
detector = cv2.aruco.ArucoDetector(aruco_dict, parameters)

# === INTRODU DIMENSIUNEA REALĂ A MARKERULUI (în metri) ===
marker_size = 0.05  # 5 cm

# Deschidem camera
cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    if not ret:
        break

    # Detectăm markerii
    corners, ids, _ = detector.detectMarkers(frame)

    if ids is not None:
        cv2.aruco.drawDetectedMarkers(frame, corners, ids)

        # Estimăm poziția markerilor
        rvecs, tvecs, _ = cv2.aruco.estimatePoseSingleMarkers(corners, marker_size, camera_matrix, dist_coeffs)

        for i in range(len(ids)):
            cv2.drawFrameAxes(frame, camera_matrix, dist_coeffs, rvecs[i], tvecs[i], 0.03)

            # Afișăm coordonatele
            tvec = tvecs[i][0]
            x, y, z = tvec
            text = f"ID {ids[i][0]}: X={x:.2f}m, Y={y:.2f}m, Z={z:.2f}m"
            cv2.putText(frame, text, (10, 30 + i * 30), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)

    # Afișăm rezultatul
    cv2.imshow('Aruco Pose Estimation', frame)

    # Ieșire cu 'q' sau ESC
    key = cv2.waitKey(1)
    if key == ord('q') or key == 27:
        break

cap.release()
cv2.destroyAllWindows()
