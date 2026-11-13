# Anime-57M-R-Tableau-Pipeline
High-throughput R (Tidyverse) ETL pipeline and interactive Tableau BI dashboard processing 57.6M+ Anime rating records entirely offline on constrained local hardware (4GB RAM, Intel i3) with 99.46% compression.


Big Data Engineering & Local Analytics: 57.6M Anime Rating Data PipelineA zero-cost, high-performance R data pipeline and Tableau analytics architecture designed to ingest, process, and visualize over 57.6 million anime rating records on constrained, low-spec local hardware ($4\text{ GB}$ RAM, Intel Core i3).
📌 Repository Description for GitHubHigh-throughput R-based ETL pipeline and interactive Tableau dashboard processing $57.6\text{M}+$ rows entirely offline. Features memory-optimized integer casting, 99.46% row compression efficiency, local hardware benchmarking, and actionable power-user insights.

💻 Hardware Constraints & Local Environment
Developed, tested, and benchmarked under strict physical hardware limitations with zero cloud support ($0$ budget)
:
Processor (CPU): Intel Core i3 $1.2\text{ GHz}$ (Entry-level dual-core architecture)Total System RAM: $4.0\text{ GB}$ physical memory ceilin

gOperating System: Windows 10 OS (~$2.0\text{ GB}$ system overhead)Available Workspace RAM: ~$2.0\text{ GB}$ dedicated to R & Tableau executionStorage & Execution: $100\%$ offline local disk processing

🏗️ System Architecture:

  Data Pipeline FlowThe end-to-end data lifecycle follows a robust 4-tier local ETL workflow:[ 1. Raw Ingestion ] ──> 57.6M CSV rows ingested via `readr::read_csv`
       │
       ▼
[ 2. Tidy Cleaning ] ──> Deduplication & strict positive filtering
       │
       ▼
[ 3. User Aggregation ] ──> In-memory `dplyr` grouping compressed to 310,058 profiles
       │
       ▼
[ 4. Tableau Visuals ] ──> 7.7MB optimized CSV exported for dashboard rendering
📉 Row Compression Efficiency
    Leveraging in-memory dplyr grouping shrinks $57,633,278$ raw rows into a lightweight $7.7\text{ MB}$ analytical table, achieving a 99.46% row compression efficiency.
    
  📝 R Data Pipeline & Tidyverse ETL Script
  
  The R script is engineered to bypass strict memory bottlenecks through type casting and single-pass summarisation:library(tidyverse)
library(readr)

# Ingest raw dataset
data_raw <- read_csv("data_raw.csv")

# Transformation & Compression Pipeline
final_57M_anime_rating_data <- data_raw %>%
  distinct() %>%
  mutate(
    user_id = as.integer(user_id),
    anime_id = as.integer(anime_id),
    rating = as.integer(rating)
  ) %>%
  filter(user_id > 0 & anime_id > 0 & rating > 0) %>%
  group_by(user_id) %>%
  summarise(
    Avg_Rating = mean(rating, na.rm = TRUE),
    Total_Rating = n(),
    .groups = 'drop'
  ) %>%
  arrange(desc(Total_Rating))

# View sample and export optimized table
glimpse(final_57M_anime_rating_data)
write.csv(final_57M_anime_rating_data, "Anime_rating_57M_data.csv", row.names = FALSE)


Key Optimizations:

   Integer Type Casting: Halves the RAM footprint compared to default 64-bit doubles.Strict
Positive Filtering: Removes unrated or anomalous entries early in the pipeline.
Single-Pass Summarisation: Efficiently computes user mean scores and total rating counts in one go.

📊 Tableau Dashboard Numeric Metrics

   The Tableau Public dashboard processes aggregated metrics across massive scale:Total Raw Ratings: $57,633,278$ historical records.
   
   Total Unique Users: $310,058$ aggregated reviewer profiles.
   Global Mean Rating: $7.79$ average score level across the catalog.
   
   Indexed Series Catalogue: $16,215$ unique anime titles.
   Technical Note: "Since this dashboard scales across $57+$ million raw records processed entirely locally on a $0$ budget, the visualizations naturally reflect the sheer volume and granularity of the dataset."
   
   💡 Actionable Business Insights
   
  Power-User VIP Retention: Target the top $1\%$ of reviewers driving catalog discovery and engagement:User #189037: $15,455$ ratings (Avg: $6.98$)User #162615: $14,864$ ratings (Avg: $10.00$)User #68042: $13,462$ ratings (Avg: $5.92$)User #283786: $12,778$ ratings (Avg: $6.73$)Bot & Bias Normalization: Down-weight uniform $10.0$ scorers and outlier behaviors in predictive recommendation models.
  Zero-Cloud Cost Scalability: Demonstrate that heavy datasets can be pre-aggregated successfully on constrained hardware before BI ingestion.
  
  
  👤 Author & Connect
  
  Niaz Mohammad Shoyab
  Data Analyst & Big Data Pipeline Engineer
  LinkedIn: www.linkedin.com/in/niaz-shoyab-495061b8
  GitHub: github.com/talkmriul-bit
  Email: talkmridul@gmail.com
