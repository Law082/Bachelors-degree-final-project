import cv2
from ultralytics import YOLO

# Încarcă modelul antrenat
model = YOLO(r"C:\Users\laurc\Downloads\best.pt") 

# Deschide camera (0 = camera principală a laptopului)
cap = cv2.VideoCapture(0)

if not cap.isOpened():
    print("Eroare: nu s-a putut accesa camera.")
    exit()

# Setări pentru filtrare
confidence_threshold = 0.5
min_area = 3000  # Minim pixeli pentru o detecție validă

while True:
    ret, frame = cap.read()
    if not ret:
        print("Eroare la citirea cadrelor.")
        break

    # Rulează detecția pe fiecare frame
    results = model(frame)[0]

    # Creează un cadru de ieșire
    annotated_frame = frame.copy()

    # Parcurge toate cutiile detectate
    for box in results.boxes:
        conf = float(box.conf)
        if conf < confidence_threshold:
            continue

        # Coordonatele cutiei
        x1, y1, x2, y2 = map(int, box.xyxy[0])
        area = (x2 - x1) * (y2 - y1)

        if area < min_area:
            continue

        # Eticheta clasei
        cls = int(box.cls)
        label = f"{model.names[cls]} {conf:.2f}"

        # Desenează bounding box și etichetă
        cv2.rectangle(annotated_frame, (x1, y1), (x2, y2), (0, 255, 0), 2)
        cv2.putText(annotated_frame, label, (x1, y1 - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)

    # Afișează imaginea cu detecțiile
    cv2.imshow("Detecție YOLOv8", annotated_frame)

    # Ieșire dacă se apasă 'q'
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Eliberare resurse
cap.release()
cv2.destroyAllWindows()
