🛍️ Amazon Product Review — Sentiment & Customer Experience Analytics

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

🛠 Tech Stack
![images](https://github.com/user-attachments/assets/d75166f5-6d91-4cec-8209-8459fbef2c77)

<img width="830" height="465" alt="Screenshot 2026-03-05 172025" src="https://github.com/user-attachments/assets/3f4b7b79-5448-44b3-8c56-f97d367f82bc" />
<img width="832" height="470" alt="Screenshot 2026-03-05 172037" src="https://github.com/user-attachments/assets/fc606431-0e49-4961-b99f-8a72c85d696a" />
<img width="830" height="468" alt="Screenshot 2026-03-05 172049" src="https://github.com/user-attachments/assets/ef5eec6b-80b1-48e6-872f-39f8968ba79d" />
<img width="833" height="467" alt="Screenshot 2026-03-05 172103" src="https://github.com/user-attachments/assets/985792b6-61d2-403f-94e6-faadf194d3b9" />
<img width="832" height="472" alt="Screenshot 2026-03-05 172116" src="https://github.com/user-attachments/assets/8e2ae161-436a-4a27-858c-b68912fd670c" />
<img width="830" height="467" alt="Screenshot 2026-03-05 172132" src="https://github.com/user-attachments/assets/03a14a7c-14b6-4cab-bf36-29937b73381b" />
<img width="833" height="468" alt="Screenshot 2026-03-05 172144" src="https://github.com/user-attachments/assets/205de554-b736-45ae-9f63-9a23336d8cc2" />





