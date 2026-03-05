# 🛍️ Amazon Product Review — Sentiment & Customer Experience Analytics
End-to-end analytics pipeline transforming 18,629 unstructured Amazon product reviews into structured business intelligence — spanning NLP modeling, SQL analytics, and a 7-page executive Power BI dashboard.

### 📌 Table of Contents

* Project Overview
* Business Questions
* Key Findings
* Tech Stack
* Project Architecture
* Repository Structure
* How to Run
* Dashboard Pages
* SQL Views
* NLP Pipeline
* Dataset


### 🎯 Project Overview
This project simulates a real-world customer experience analytics workflow. Raw Amazon review text is processed through a full NLP pipeline, loaded into PostgreSQL for scalable analytics, and visualized in Power BI for executive decision-making.
The core insight this project uncovers: star ratings alone are not enough. By comparing text sentiment against star ratings, the pipeline identifies 842 "hidden dissatisfaction" cases — customers who gave high ratings but expressed negative sentiment in their review text. These represent silent churn risk invisible to traditional rating-based monitoring.

### 🧠 Business Questions

* What is the overall customer sentiment health?
* How does text sentiment align with star ratings?
* Are there hidden dissatisfaction signals within positive ratings?
* Which product categories have the highest dissatisfaction risk?
* Which categories drive the strongest customer loyalty?
* Where should product improvement efforts focus?
* Is customer satisfaction trending better or worse over time?

### 📊 Key Findings

<img width="900" height="480" alt="image" src="https://github.com/user-attachments/assets/62dfdcef-4bff-4ce0-9a57-be752327b99a" />

### 🏗 Project Architecture
The project is built across three layers, each feeding into the next.

#### Layer 1 — Python / Jupyter Notebook

1. Load and merge two Datafiniti Amazon review datasets (~19,672 rows combined)
2. Resolve schema drift between datasets
3. Remove duplicates and clean nulls → final dataset 18,629 rows
4. Build full NLP preprocessing pipeline
5. Apply TextBlob polarity scoring
6. Engineer features:
* review_length
* word_count
* helpfulness_level
* satisfaction_segment
* rating_sentiment
* category_group
* sentiment_mismatch
7. Detect hidden dissatisfaction
8. Export cleaned dataset → reviews_postgres.csv
#### Layer 2 — PostgreSQL / SQL

* Import processed CSV into PostgreSQL reviews table
* Build 5 analytical views to power the dashboard

#### Layer 3 — Power BI

* Connect directly to PostgreSQL
* Build 7-page executive dashboard with KPI cards, charts, and time-series trends

### ▶️ How to Run
Prerequisites
* Python 3.8+
* PostgreSQL 13+
* Power BI Desktop (free)

#### Install Python Dependencies
</> Bash
>pip install pandas numpy nltk textblob missingno matplotlib
 python -m nltk.downloader punkt stopwords

##### **Step 1** — Download Dataset
Download the datasets from Kaggle (see Dataset
) and place them in your project folder.

##### **Step 2** — Run the Notebook
</> Bash
>jupyter notebook Amazon_customer_sentiment_analysis.ipynb

This generates: reviews_postgres.csv

##### **Step 3** — Create PostgreSQL Database
</> Bash
>psql -U postgres -c "CREATE DATABASE amazon_sentiment;"

##### **Step 4** — Run SQL Script
</> Bash
>psql -U postgres -d amazon_sentiment -f Amazon_Sentiment_Analysis.sql

##### **Step 5** — Import CSV
</> SQL
>COPY reviews
FROM '/path/to/reviews_postgres.csv'
DELIMITER ','
CSV HEADER;

##### **Step 6** — Open Power BI
Connect to your PostgreSQL database and import:
* reviews
* kpi_overview
* loyalty_ratio
* hidden_dissatisfaction
* category_detractor_rate
* category_performance
The dashboard will populate automatically.

### 📈 Dashboard Pages

<img width="996" height="444" alt="Screenshot 2026-03-05 183453" src="https://github.com/user-attachments/assets/04694fed-3c40-4e62-a05d-460d4a16b25c" />

### 🗄 SQL Views

<img width="827" height="471" alt="image" src="https://github.com/user-attachments/assets/f9bb36de-b0e4-410d-890a-6dc352b83937" />

### 🔬 NLP Pipeline

The text preprocessing pipeline normalizes review text before sentiment scoring.
##### **Step 1** — Lowercasing
All review text converted to lowercase.

##### **Step 2** — Punctuation Removal
Non-letter characters removed while preserving apostrophes.

##### **Step 3** — Contraction Expansion
Examples:
>* didn't → did not
>* can't → cannot
>* won't → will not

##### **Step 4** — Tokenization
Using NLTK word_tokenize()

##### **Step 5** — Stopword Removal
Using NLTK stopword list while preserving negation words:
>* not
>* never
>* no
##### **Step 6** — Sentiment Scoring
TextBlob polarity score
Range:
>* -1.0 → most negative
>* +1.0 → most positive

##### **Step 7** — Hidden Dissatisfaction Detection
Flagged when:
>rating_sentiment = positive
AND
text_sentiment = negative

### 📦 Dataset

Source:
Datafiniti Amazon Consumer Reviews — Kaggle
https://www.kaggle.com/datasets/datafiniti/consumer-reviews-of-amazon-products
Download both files:
* Datafiniti_Amazon_Consumer_Reviews_of_Amazon_Products.csv
* Datafiniti_Amazon_Consumer_Reviews_of_Amazon_Products_May19.csv
  <img width="814" height="275" alt="Screenshot 2026-03-05 184649" src="https://github.com/user-attachments/assets/e55b5988-8274-457e-9f30-d949f17e2150" />

## 👤 Author
Shourya Mishra
* https://www.linkedin.com/in/shourya-mishra-career/
* https://github.com/shouryamishra48-arch

⭐ This project demonstrates end-to-end analytics capability — from raw unstructured text to executive business intelligence — using Python, SQL, NLP, and Power BI.
