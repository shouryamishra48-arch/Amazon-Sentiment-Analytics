# 🛍️ Amazon Product Review — Sentiment & Customer Experience Analytics

End-to-end analytics pipeline transforming 18,629 unstructured Amazon product reviews into structured business intelligence — spanning NLP modeling, SQL analytics, and a 7-page executive Power BI dashboard.

📌 Table of Contents

Project Overview

Business Questions

Key Findings

Tech Stack

Project Architecture

Repository Structure

How to Run

Dashboard Pages

SQL Views

NLP Pipeline

Dataset

Author

🎯 Project Overview

This project simulates a real-world customer experience analytics workflow.

Raw Amazon review text is processed through a full NLP pipeline, loaded into PostgreSQL for scalable analytics, and visualized in Power BI for executive decision-making.

The core insight this project uncovers:

⭐ Star ratings alone are not enough.

By comparing text sentiment vs star ratings, the pipeline identifies 842 hidden dissatisfaction cases — customers who gave high ratings but expressed negative sentiment in the review text.

These represent silent churn risk invisible to traditional rating-based monitoring.

🧠 Business Questions

What is the overall customer sentiment health?

How does text sentiment align with star ratings?

Are there hidden dissatisfaction signals within positive ratings?

Which product categories have the highest dissatisfaction risk?

Which categories drive the strongest customer loyalty?

Where should product improvement efforts focus?

Is customer satisfaction trending better or worse over time?

📊 Key Findings
Metric	Value	Insight
Total Reviews Analyzed	18,629	Clean merged dataset
Average Star Rating	4.49 / 5	Strong overall satisfaction
Average Sentiment Score	0.335	Positive polarity confirmed by NLP
Positive Sentiment Rate	82.75%	Majority of customers satisfied
Promoter to Detractor Ratio	7.34 : 1	Strong loyalty base
Hidden Dissatisfaction Rate	4.52%	842 silent-risk customers
Highest Risk Category	Batteries — 13.88% detractor rate	Structural quality issue
Top Satisfaction Category	Smart Home — 0.373 avg sentiment	Highest NLP satisfaction score
🛠 Tech Stack










Layer	Tools Used
Data Processing	Python, Pandas, NumPy
NLP	NLTK, TextBlob
Analytics	PostgreSQL, SQL
Visualization	Power BI
🏗 Project Architecture

The project is built across three layers, each feeding into the next.

Layer 1 — Python / Jupyter Notebook

Load and merge two Datafiniti Amazon review datasets (~19,672 rows combined)

Resolve schema drift between datasets

Remove duplicates and clean nulls → final dataset 18,629 rows

Build full NLP preprocessing pipeline

Apply TextBlob polarity scoring

Engineer features:

review_length

word_count

helpfulness_level

satisfaction_segment

rating_sentiment

category_group

sentiment_mismatch

Detect hidden dissatisfaction

Export cleaned dataset → reviews_postgres.csv

Layer 2 — PostgreSQL / SQL

Import processed CSV into PostgreSQL reviews table

Build 5 analytical views powering the dashboard

Layer 3 — Power BI

Connect directly to PostgreSQL

Build 7-page executive dashboard

KPI cards, category comparisons, and time-series sentiment trends

📁 Repository Structure
amazon-sentiment-analytics/
│
├── Amazon_customer_sentiment_analysis.ipynb
│   # Full NLP pipeline
│
├── Amazon_Sentiment_Analysis.sql
│   # PostgreSQL table + analytics views
│
└── README.md

⚠️ The processed CSV is not included due to file size.

Run the notebook to generate it after downloading the dataset from the Dataset section.

▶️ How to Run
Prerequisites

Python 3.8+

PostgreSQL 13+

Power BI Desktop (free)

Install Python Dependencies
pip install pandas numpy nltk textblob missingno matplotlib
python -m nltk.downloader punkt stopwords
Step 1 — Download Dataset

Download the datasets from Kaggle (see Dataset
) and place them in your project folder.

Step 2 — Run the Notebook
jupyter notebook Amazon_customer_sentiment_analysis.ipynb

This generates:

reviews_postgres.csv

The cleaned + NLP enriched dataset.

Step 3 — Create PostgreSQL Database
psql -U postgres -c "CREATE DATABASE amazon_sentiment;"
Step 4 — Run SQL Script
psql -U postgres -d amazon_sentiment -f Amazon_Sentiment_Analysis.sql
Step 5 — Import CSV
COPY reviews
FROM '/path/to/reviews_postgres.csv'
DELIMITER ','
CSV HEADER;
Step 6 — Open Power BI

Connect to your PostgreSQL database and import:

reviews

kpi_overview

loyalty_ratio

hidden_dissatisfaction

category_detractor_rate

category_performance

The dashboard will populate automatically.

📈 Dashboard Pages
Page	Title	Business Question
1	Executive Overview	How healthy is overall customer experience?
2	Category Performance Insights	Which categories satisfy or frustrate customers most?
3	Hidden Dissatisfaction Analysis	Where are silent risk signals hiding?
4	Customer Behavior Insights	Do engagement patterns reveal satisfaction signals?
5	Product Improvement Priorities	Where should product teams focus effort?
6	Customer Issue Drivers	What drives negative sentiment and risk?
7	Sentiment Trends Over Time	Is customer satisfaction improving or declining?
🗄 SQL Views
View	Purpose	Key Result
kpi_overview	Top-level KPIs	Total reviews, avg rating, avg sentiment
loyalty_ratio	NPS-style loyalty metric	Promoter-to-detractor ratio = 7.34
hidden_dissatisfaction	Rating vs text mismatch detection	Hidden issue rate = 4.52%
category_detractor_rate	Risk ranking by category	Batteries = 13.88% detractor rate
category_performance	Category sentiment comparison	Smart Home = 0.373 avg sentiment
🔬 NLP Pipeline

The text preprocessing pipeline normalizes review text before sentiment scoring.

Step 1 — Lowercasing

All review text converted to lowercase.

Step 2 — Punctuation Removal

Non-letter characters removed while preserving apostrophes.

Step 3 — Contraction Expansion

Examples:

didn't → did not
can't → cannot
won't → will not
Step 4 — Tokenization

Using NLTK word_tokenize()

Step 5 — Stopword Removal

Using NLTK stopword list while preserving negation words:

not
never
no
Step 6 — Sentiment Scoring

TextBlob polarity score

Range:

-1.0 → most negative
+1.0 → most positive
Step 7 — Hidden Dissatisfaction Detection

Flagged when:

rating_sentiment = positive
AND
text_sentiment = negative
📦 Dataset

Source:

Datafiniti Amazon Consumer Reviews — Kaggle

https://www.kaggle.com/datasets/datafiniti/consumer-reviews-of-amazon-products

Download both files:

Datafiniti_Amazon_Consumer_Reviews_of_Amazon_Products.csv

Datafiniti_Amazon_Consumer_Reviews_of_Amazon_Products_May19.csv

Property	Value
Combined raw rows	~19,672
After cleaning	18,629
Product categories	7
Categories	Batteries, Tablets, Smart Home, Computing, Electronics, eReaders, Other
👤 Author

Shourya Mishra
Data Analyst

LinkedIn

GitHub

⭐ This project demonstrates end-to-end analytics capability — from raw unstructured text to executive business intelligence — using Python, SQL, NLP, and Power BI.

