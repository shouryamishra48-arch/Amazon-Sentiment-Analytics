CREATE TABLE reviews (
    product TEXT,
    brand TEXT,
    category_group TEXT,
    primary_category TEXT,

    review_text TEXT,
    review_title TEXT,

    rating INT,
    review_date TIMESTAMP,

    helpful_votes INT,
    recommend BOOLEAN,

    clean_review TEXT,
    polarity FLOAT,
    text_sentiment TEXT,
    sentiment_strength TEXT,
    sentiment_mismatch BOOLEAN,

    rating_sentiment TEXT,
    satisfaction_segment TEXT,
    recommendation_alignment BOOLEAN,
    helpfulness_level TEXT,

    review_length INT,
    word_count INT
);

SELECT COUNT(*) FROM reviews;

SELECT product, category_group, rating, text_sentiment
FROM reviews
LIMIT 5;

SELECT
    text_sentiment,
    COUNT(*) AS review_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM reviews
GROUP BY text_sentiment
ORDER BY review_count DESC;

SELECT
    satisfaction_segment,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM reviews
GROUP BY satisfaction_segment
ORDER BY total DESC;

SELECT
    category_group,
    COUNT(*) AS total_reviews,
    ROUND(AVG(polarity), 3) AS avg_sentiment,
    SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) AS detractors,
    SUM(CASE WHEN satisfaction_segment = 'promoter' THEN 1 ELSE 0 END) AS promoters
FROM reviews
GROUP BY category_group
ORDER BY avg_sentiment ASC;

SELECT
    category_group,
    ROUND(
        SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS detractor_rate
FROM reviews
GROUP BY category_group
ORDER BY detractor_rate DESC;

SELECT
    category_group,
    COUNT(*) AS hidden_issues
FROM reviews
WHERE rating_sentiment = 'positive'
AND text_sentiment = 'negative'
GROUP BY category_group
ORDER BY hidden_issues DESC;

SELECT
    category_group,
    COUNT(*) AS total_reviews,
    ROUND(AVG(polarity)::numeric, 3) AS avg_sentiment,
    SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) AS detractors,
    SUM(CASE WHEN satisfaction_segment = 'promoter' THEN 1 ELSE 0 END) AS promoters
FROM reviews
GROUP BY category_group
ORDER BY avg_sentiment ASC;

SELECT
    product,
    category_group,
    rating,
    helpful_votes,
    LEFT(review_text, 120) AS review_preview
FROM reviews
WHERE helpful_votes > 10
ORDER BY helpful_votes DESC
LIMIT 10;

SELECT
    product,
    category_group,
    COUNT(*) AS detractor_count
FROM reviews
WHERE satisfaction_segment = 'detractor'
GROUP BY product, category_group
ORDER BY detractor_count DESC
LIMIT 10;

SELECT
    product,
    category_group,
    COUNT(*) AS promoter_count
FROM reviews
WHERE satisfaction_segment = 'promoter'
GROUP BY product, category_group
ORDER BY promoter_count DESC
LIMIT 10;

SELECT
    category_group,
    COUNT(*) AS passive_count
FROM reviews
WHERE satisfaction_segment = 'passive'
GROUP BY category_group
ORDER BY passive_count DESC;

SELECT
    rating,
    ROUND(AVG(review_length)) AS avg_review_length,
    COUNT(*) AS review_count
FROM reviews
GROUP BY rating
ORDER BY rating;

SELECT
    helpfulness_level,
    ROUND(AVG(review_length)) AS avg_length,
    COUNT(*) AS review_count
FROM reviews
GROUP BY helpfulness_level
ORDER BY avg_length DESC;

SELECT
    COUNT(*) AS total_reviews,
    ROUND(AVG(rating)::numeric, 2) AS avg_rating,
    ROUND(AVG(polarity)::numeric, 3) AS avg_sentiment,
    SUM(CASE WHEN satisfaction_segment = 'promoter' THEN 1 ELSE 0 END) AS promoters,
    SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) AS detractors,
    ROUND(
        SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS detractor_rate,
    ROUND(
        SUM(CASE WHEN satisfaction_segment = 'promoter' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS promoter_rate
FROM reviews;

SELECT
    COUNT(*) AS hidden_issues,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM reviews),
        2
    ) AS hidden_issue_rate
FROM reviews
WHERE rating_sentiment = 'positive'
AND text_sentiment = 'negative';

SELECT
    category_group,
    ROUND(
        SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS detractor_rate
FROM reviews
GROUP BY category_group
ORDER BY detractor_rate DESC
LIMIT 1;

SELECT
    category_group,
    ROUND(AVG(polarity)::numeric, 3) AS avg_sentiment
FROM reviews
GROUP BY category_group
ORDER BY avg_sentiment DESC
LIMIT 1;

SELECT
    ROUND(
        SUM(CASE WHEN satisfaction_segment = 'promoter' THEN 1 ELSE 0 END)::numeric
        /
        NULLIF(SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END), 0),
        2
    ) AS promoter_to_detractor_ratio
FROM reviews;

CREATE VIEW kpi_overview AS
SELECT
    COUNT(*) AS total_reviews,
    ROUND(AVG(rating)::numeric, 2) AS avg_rating,
    ROUND(AVG(polarity)::numeric, 3) AS avg_sentiment,
    SUM(CASE WHEN satisfaction_segment = 'promoter' THEN 1 ELSE 0 END) AS promoters,
    SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) AS detractors
FROM reviews;

CREATE VIEW hidden_dissatisfaction AS
SELECT
    COUNT(*) AS hidden_issues,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM reviews),
        2
    ) AS hidden_issue_rate
FROM reviews
WHERE rating_sentiment = 'positive'
AND text_sentiment = 'negative';

CREATE VIEW category_performance AS
SELECT
    category_group,
    COUNT(*) AS total_reviews,
    ROUND(AVG(polarity)::numeric, 3) AS avg_sentiment,
    SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) AS detractors,
    SUM(CASE WHEN satisfaction_segment = 'promoter' THEN 1 ELSE 0 END) AS promoters
FROM reviews
GROUP BY category_group;

CREATE VIEW category_detractor_rate AS
SELECT
    category_group,
    ROUND(
        SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS detractor_rate
FROM reviews
GROUP BY category_group;

CREATE VIEW loyalty_ratio AS
SELECT
    ROUND(
        SUM(CASE WHEN satisfaction_segment = 'promoter' THEN 1 ELSE 0 END)::numeric
        /
        NULLIF(SUM(CASE WHEN satisfaction_segment = 'detractor' THEN 1 ELSE 0 END), 0),
        2
    ) AS promoter_to_detractor_ratio
FROM reviews;

SELECT * FROM kpi_overview;