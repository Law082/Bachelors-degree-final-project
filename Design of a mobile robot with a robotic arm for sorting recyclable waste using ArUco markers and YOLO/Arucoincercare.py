import cv2

# Alegem dicționarul markerilor ArUco
aruco_dict = cv2.aruco.getPredefinedDictionary(cv2.aruco.DICT_4X4_50)

# Parametrii pentru detector
parameters = cv2.aruco.DetectorParameters()
detector = cv2.aruco.ArucoDetector(aruco_dict, parameters)

# Deschidem camera web
cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    if not ret:
        break

    # Detectăm markerii
    corners, ids, _ = detector.detectMarkers(frame)

    # Dacă detectăm markerii, îi desenăm
    if ids is not None:
        cv2.aruco.drawDetectedMarkers(frame, corners, ids)

        # Parcurgem fiecare marker detectat și afișăm coordonatele colțurilor
        for i in range(len(ids)):
            c = corners[i][0]  # Coordonatele colțurilor markerului (array 4x2)
            print(f"Marker ID {ids[i][0]}: {c}")

            # Afișăm coordonatele pe ecran
            for j in range(4):
                cv2.putText(frame, f"{c[j]}", (int(c[j][0]), int(c[j][1])),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 1)

    # Afișăm cadrul cu markerii detectați
    cv2.imshow('Aruco Marker Detection', frame)

    # Ieșim din buclă la apăsarea tastei 'q'
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Închidem camera și ferestrele
cap.release()
cv2.destroyAllWindows()
