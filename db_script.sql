-- Таблиця "User"
CREATE TABLE "User" (
    user_id INT PRIMARY KEY,                      -- Первинний ключ
    mood VARCHAR(50) NOT NULL,                    -- Настрій користувача (не NULL)
    CHECK (mood ~ '^[a-zA-Z]+$')                  -- Обмеження регулярного виразу для настрою
);

-- Таблиця Psychologist
CREATE TABLE Psychologist (
    psychologist_id INT PRIMARY KEY,              -- Первинний ключ
    name VARCHAR(100) NOT NULL,                   -- Ім'я психолога
    experience_years INT CHECK (experience_years >= 0), -- Досвід у роках (має бути >= 0)
    CHECK (name ~ '^[A-Z][a-zA-Z\s\-]*$')         -- Обмеження регулярного виразу для імені
);

-- Таблиця Report
CREATE TABLE Report (
    report_id INT PRIMARY KEY,                    -- Первинний ключ
    summary VARCHAR(500),                         -- Короткий опис звіту
    report_date DATE,                             -- Дата звіту
    user_id INT,                                  -- Зовнішній ключ на таблицю "User"
    psychologist_id INT,                          -- Зовнішній ключ на таблицю Psychologist
    FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    FOREIGN KEY (psychologist_id) REFERENCES Psychologist(psychologist_id)
);

-- Таблиця Emotion_State
CREATE TABLE Emotion_State (
    emotion_id INT PRIMARY KEY,                   -- Первинний ключ
    emotion_type VARCHAR(50),                     -- Тип емоції
    intensity INT CHECK (intensity >= 0 AND intensity <= 100), -- Інтенсивність (межа 0-100)
    user_id INT,                                  -- Зовнішній ключ на таблицю "User"
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

-- Таблиця Recommendation
CREATE TABLE Recommendation (
    recommendation_id INT PRIMARY KEY,            -- Первинний ключ
    content VARCHAR(200),                         -- Рекомендація
    emotion_id INT,                               -- Зовнішній ключ на таблицю Emotion_State
    FOREIGN KEY (emotion_id) REFERENCES Emotion_State(emotion_id)
);

-- Таблиця Track
CREATE TABLE Track (
    track_id INT PRIMARY KEY,                     -- Первинний ключ
    title VARCHAR(100),                           -- Назва треку
    genre VARCHAR(50),                            -- Жанр треку
    duration INT CHECK (duration >= 0),           -- Тривалість треку (має бути >= 0)
    user_id INT,                                  -- Зовнішній ключ на таблицю "User"
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);
