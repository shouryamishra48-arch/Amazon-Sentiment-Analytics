# 🛍️ Amazon Product Review Sentiment Analytics

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
Dataset


🎯 Project Overview
This project simulates a real-world customer experience analytics workflow. Raw Amazon review text is processed through a full NLP pipeline, loaded into PostgreSQL for scalable analytics, and visualized in Power BI for executive decision-making.
The core insight this project uncovers: star ratings alone are not enough. By comparing text sentiment against star ratings, the pipeline identifies 842 "hidden dissatisfaction" cases — customers who gave high ratings but expressed negative sentiment in their review text. These represent silent churn risk invisible to traditional rating-based monitoring.

🧠 Business Questions
#Question1What is the overall customer sentiment health?2How does text sentiment align with star ratings?3Are there hidden dissatisfaction signals within positive ratings?4Which product categories have the highest dissatisfaction risk?5Which categories drive the strongest customer loyalty?6Where should product improvement efforts focus?7Is customer satisfaction trending better or worse over time?

📊 Key Findings
MetricValueInsightTotal Reviews Analyzed18,629Clean merged datasetAverage Star Rating4.49 / 5Strong overall satisfactionAverage Sentiment Score0.335Positive polarity confirmed by NLPPositive Sentiment Rate82.75%Majority of customers satisfiedPromoter : Detractor Ratio7.34 : 1Strong loyalty baseHidden Dissatisfaction Rate4.52%842 silent-risk customersHighest Risk CategoryBatteries — 13.88% detractor rateStructural quality issueTop Satisfaction CategorySmart Home — 0.373 avg sentimentHighest NLP satisfaction score

🏗 Project Architecture

Raw CSV Data (2 datasets, ~19,672 rows)
        │
        ▼
┌─────────────────────────────────┐
│   LAYER 1 — Python / Jupyter    │
│                                 │
│  • Schema alignment & merge     │
│  • Data cleaning (18,629 rows)  │
│  • NLP preprocessing pipeline   │
│  • TextBlob sentiment scoring   │
│  • Feature engineering          │
│  • Hidden dissatisfaction logic │
│  • Export → reviews_postgres.csv│
└──────────────┬──────────────────┘
               │
               ▼
┌─────────────────────────────────┐
│   LAYER 2 — PostgreSQL / SQL    │
│                                 │
│  • reviews table                │
│  • kpi_overview view            │
│  • loyalty_ratio view           │
│  • hidden_dissatisfaction view  │
│  • category_detractor_rate view │
│  • category_performance view    │
└──────────────┬──────────────────┘
               │
               ▼
┌─────────────────────────────────┐
│   LAYER 3 — Power BI            │
│                                 │
│  • 7-page executive dashboard   │
│  • Direct PostgreSQL connection │
│  • KPI cards, charts, trends    │
└─────────────────────────────────┘

📁 Repository Structure

amazon-sentiment-analytics/
│
├── Amazon_customer_sentiment_analysis.ipynb   # Full NLP pipeline
├── Amazon_Sentiment_Analysis.sql              # PostgreSQL table + views
├── README.md                                  # This file
│
└── data/
    └── (Download datasets from Kaggle — see Dataset section)

⚠️ The processed CSV (reviews_postgres.csv) is not included due to file size. Run the notebook to generate it.

▶️ How to Run
Prerequisites
Python 3.8+
PostgreSQL 13+
Power BI Desktop (free)

Python Dependencies
###bash
pip install pandas numpy nltk textblob missingno matplotlib
python -m nltk.downloader punkt stopwords

Step-by-Step
1. Download the datasets from Kaggle (see Dataset section) and place them in your project folder.
2. Run the Jupyter Notebook
### bash
jupyter notebook Amazon_customer_sentiment_analysis.ipynb




