# Analytics & Reporting Templates — Game Data Science

Reusable fill-in scaffolds for the gamestudio-data-scientist agent. Copy the relevant block, replace every `[bracketed]` placeholder, and delete rows/sections that do not apply.

## Analytics Setup — Essential Metrics Framework

```
DATA SCIENTIST: ANALYTICS SETUP
================================

Project: [Project Name]
Platform: [PC/Mobile/Console]
Genre: [Genre]

ESSENTIAL METRICS FRAMEWORK
---------------------------

1. PLAYER ENGAGEMENT METRICS
   Core Metrics to Track:
   - DAU (Daily Active Users)
   - MAU (Monthly Active Users)
   - Session Length (avg, median, distribution)
   - Session Frequency (sessions per day/week)
   - Stickiness (DAU/MAU ratio)

   Platform-Specific:
   Mobile:
   - App Opens per Day
   - Time to First Session
   - Background vs Active Time

   PC/Console:
   - Launch to Gameplay Time
   - Settings Changes
   - Hardware Performance

2. RETENTION METRICS
   Critical Checkpoints:
   - D1 Retention (Next day return)
   - D7 Retention (Week survival)
   - D30 Retention (Month survival)
   - D90 Retention (Long-term)

   Cohort Analysis:
   - By acquisition source
   - By player segment
   - By version/update
   - By platform

3. PROGRESSION METRICS
   - Level/Stage Completion Rates
   - Time to Complete Content
   - Difficulty Spike Detection
   - Drop-off Points
   - Replay Rates

4. MONETIZATION METRICS
   Free-to-Play:
   - Conversion Rate (Free to Paid)
   - ARPU (Average Revenue Per User)
   - ARPPU (Average Revenue Per Paying User)
   - LTV (Lifetime Value)
   - Purchase Frequency
   - Time to First Purchase

   Premium:
   - Refund Rate
   - DLC Attach Rate
   - Wishlist Conversion
   - Price Point Sensitivity

5. SOCIAL & VIRALITY METRICS
   - Invite Send Rate
   - Invite Accept Rate
   - Social Feature Usage
   - Guild/Clan Participation
   - User Generated Content
```

## Data Pipeline & Event Schema

```
DATA PIPELINE DESIGN
====================

COLLECTION LAYER
---------------
Game Client → Events
   ↓
Event Types:
- System Events (automated)
  - Session Start/End
  - Level Complete
  - Purchase Made
  - Error Occurred

- Gameplay Events (designer-defined)
  - Player Actions
  - Choices Made
  - Items Used
  - Deaths/Failures

- Custom Events (specific tracking)
  - Tutorial Steps
  - Feature Discovery
  - Social Interactions
  - Settings Changes

PROCESSING LAYER
---------------
Raw Events → Validation → Enrichment → Aggregation
                ↓             ↓            ↓
            Clean Data    User Profile  Metrics

STORAGE LAYER
------------
Real-time: Redis/Memory Cache
Daily: PostgreSQL/MySQL
Historical: S3/Cloud Storage
Analytics: BigQuery/Redshift

ANALYSIS LAYER
-------------
- Real-time Dashboards
- Daily Reports
- Predictive Models
- Alert Systems
```

## Retention Prediction Model

```
RETENTION PREDICTION MODEL
==========================

INPUT FEATURES
-------------
Day 1 Behavior:
- Session count
- Session length
- Levels completed
- Deaths/failures
- Currency earned
- Social actions
- Settings changed
- Tutorial completion

MODEL OUTPUT
-----------
Probability of returning:
- D7: [X]%
- D30: [X]%
- D90: [X]%

Churn Risk Score: [Low/Medium/High]

INTERVENTION TRIGGERS
--------------------
High Churn Risk:
→ Send push notification
→ Offer bonus reward
→ Easier difficulty
→ Social re-engagement

Medium Churn Risk:
→ Daily reward reminder
→ New content highlight
→ Friend activity update
```

## Revenue Forecast Model

```
REVENUE FORECAST MODEL
======================

30-DAY FORECAST
--------------
Based on current metrics:

Revenue Projection:
- Conservative (P10): $[X]k
- Expected (P50): $[Y]k
- Optimistic (P90): $[Z]k

Key Drivers:
1. [Metric]: [Impact]
2. [Metric]: [Impact]
3. [Metric]: [Impact]

Risk Factors:
- [Risk]: [Probability] → $[Impact]
- [Risk]: [Probability] → $[Impact]

OPTIMIZATION OPPORTUNITIES
-------------------------
Quick Wins (< 1 week):
- [Action]: +[X]% revenue
- [Action]: +[X]% conversion

Medium Term (1-4 weeks):
- [Action]: +[X]% LTV
- [Action]: +[X]% retention

Long Term (1+ months):
- [Action]: +[X]% growth
- [Action]: +[X]% engagement
```

## A/B Test Design & Results

```
A/B TEST DESIGN
===============

TEST: [Feature/Change Name]
Hypothesis: [What we expect]

SETUP
-----
Control Group (A): Current version
Test Group (B): Modified version
Sample Size: [X] users per group (computed up front from baseline rate + MDE)
Duration: [X] days (pre-committed; run to planned N, no early stopping)
Confidence: 95% (α = 0.05)

METRICS TO TRACK
---------------
Primary:
- [Main metric]: [Expected change]

Secondary:
- [Metric 2]: [Monitor for negative impact]
- [Metric 3]: [Additional insight]

Guardrail:
- [Crash rate / D1 retention / refund rate]: [Must not regress]

RESULTS ANALYSIS
---------------
Day [X] Results (analyze at planned end, not before):

Metric         | Control | Test | Diff | p-value | Significant?
---------------|---------|------|------|---------|-------------
Retention D1   | [X]%    | [Y]% | +[Z]%| 0.03    | Yes ✓
ARPU           | $[X]    | $[Y] | +$[Z]| 0.12    | No ✗
Session Length | [X]min  | [Y]min| +[Z] | 0.01    | Yes ✓

RECOMMENDATION
-------------
[Implement/Iterate/Abandon] based on:
- [Reasoning]
- [Risk assessment]
- [Expected impact]
```

## Real-Time Monitoring Dashboard

```
REAL-TIME MONITORING DASHBOARD
==============================

HEALTH METRICS (Update every 5 min)
-----------------------------------
Server Status: [Green/Yellow/Red]
Active Players: [X]k
Crash Rate: [X]%
Load Time: [X]s
FPS Average: [X]

ALERTS (Automatic triggers)
--------------------------
🔴 CRITICAL
- Crash rate > 5%
- Server downtime
- Payment failures > 10%

🟡 WARNING
- Session length -20% from baseline
- Retention drop > 10%
- Negative review spike

🟢 OPPORTUNITY
- Player spike detected
- Viral moment trending
- Influencer playing

HOURLY METRICS
-------------
Hour | Players | Revenue | Crashes | Sentiment
-----|---------|---------|---------|----------
00   | [X]k    | $[X]    | [X]     | [Score]
01   | [X]k    | $[X]    | [X]     | [Score]
...
```

## Performance Analysis

```
PERFORMANCE ANALYSIS
====================

BOTTLENECK IDENTIFICATION
------------------------
Loading Times by Phase:
- Initial Load: [X]s (Target: <3s)
- Menu Load: [X]s (Target: <1s)
- Level Load: [X]s (Target: <5s)
- Asset Stream: [X]s (Target: <0.5s)

Performance by Device Tier:
High-End (Top 20%):
- FPS: [X] avg
- Crashes: [X]%
- Battery drain: [X]%/hour

Mid-Range (Middle 60%):
- FPS: [X] avg
- Crashes: [X]%
- Battery drain: [X]%/hour

Low-End (Bottom 20%):
- FPS: [X] avg
- Crashes: [X]%
- Battery drain: [X]%/hour

OPTIMIZATION PRIORITIES
----------------------
1. [Issue]: [X]% of players affected
   Solution: [Technical fix]
   Impact: +[X]% retention

2. [Issue]: [X]% of players affected
   Solution: [Technical fix]
   Impact: +[X]% session length
```

## Weekly Data Science Report

```
WEEKLY DATA SCIENCE REPORT
==========================
Week: [Date Range]
Project: [Name]

KEY METRICS SUMMARY
------------------
         | This Week | Last Week | Change | Target | Status
---------|-----------|-----------|--------|--------|-------
DAU      | [X]k      | [Y]k      | +[Z]%  | [T]k   | ✓
Retention| [X]%      | [Y]%      | +[Z]pp | [T]%   | ✗
ARPU     | $[X]      | $[Y]      | +$[Z]  | $[T]   | ✓
Crashes  | [X]%      | [Y]%      | -[Z]pp | <1%    | ✓

TOP INSIGHTS
-----------
1. [Insight]: [Data evidence] → [Recommendation]
2. [Insight]: [Data evidence] → [Recommendation]
3. [Insight]: [Data evidence] → [Recommendation]

A/B TESTS STATUS
---------------
- [Test 1]: Day [X] of [Y], [Status]
- [Test 2]: Complete, [Winner]
- [Test 3]: Planning, starts [Date]

PREDICTIONS UPDATE
-----------------
30-day retention forecast: [X]%
Monthly revenue forecast: $[X]k
Churn risk players: [X]% of base

ACTION ITEMS
-----------
For Producer:
- [Data-driven recommendation]

For Game Designer:
- [Balance adjustment needed]

For Engineers:
- [Performance optimization]
```
