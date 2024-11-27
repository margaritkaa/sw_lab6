-- Таблиця "User"
CREATE TABLE "User" (
    user_id INT PRIMARY KEY,
    mood VARCHAR(50) NOT NULL,
    CHECK (mood ~ '^[a-zA-Z]+$')
);

-- Таблиця "Psychologist"
CREATE TABLE "Psychologist" (
    psychologist_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    experience_years INT CHECK (experience_years >= 0),
    CHECK (name ~ '^[A-Z][a-zA-Z\s\-]*$')
);

-- Таблиця "Emotion_State"
CREATE TABLE "Emotion_State" (
    emotion_id INT PRIMARY KEY,
    emotion_type VARCHAR(50),
    intensity INT CHECK (intensity >= 0 AND intensity <= 100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

-- Таблиця "Recommendation"
CREATE TABLE "Recommendation" (
    recommendation_id INT PRIMARY KEY,
    content VARCHAR(200),
    emotion_id INT,
    FOREIGN KEY (emotion_id) REFERENCES "Emotion_State"(emotion_id)
);

-- Таблиця "Track"
CREATE TABLE "Track" (
    track_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    duration INT CHECK (duration >= 0),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

-- Таблиця "Report"
CREATE TABLE "Report" (
    report_id INT PRIMARY KEY,
    summary VARCHAR(500),
    report_date DATE,
    user_id INT,
    psychologist_id INT,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    FOREIGN KEY (psychologist_id) REFERENCES "Psychologist"(psychologist_id)
);

