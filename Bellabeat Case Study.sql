Select*
From CaseStudyProject.dbo.DailyActivity

--Clean Daily Activity Table
--Change Date Format

Select ActivityDateConverted, CONVERT(Date,ActivityDate)
From CaseStudyProject.dbo.DailyActivity

Update DailyActivity
SET ActivityDate = CONVERT(Date,ActivityDate)

AlTER TABLE DailyActivity
Add ActivityDateConverted Date;

Update DailyActivity 
SET ActivityDateConverted = CONVERT(Date, ActivityDate)


--Convert TotalDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance from Float to a Decimal

Select TotalDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance
From CaseStudyProject..DailyActivity

Update DailyActivity 
SET TotalDistance = CONVERT(decimal, TotalDistance)

Update DailyActivity 
SET VeryActiveDistance = CONVERT(decimal, VeryActiveDistance)

Update DailyActivity 
SET ModeratelyActiveDistance = CONVERT(decimal, ModeratelyActiveDistance)

Update DailyActivity 
SET LightActiveDistance = CONVERT(decimal, LightActiveDistance)



--Compare Id's with the most Total Steps vs Calories Burned

Select Id, TotalSteps, CaloriesBurned
From CaseStudyProject..DailyActivity
ORDER By TotalSteps Desc


--Clean Weight Table

Select*
From CaseStudyProject..Weight


--Change Date Format

Update Weight
SET Date = CONVERT(Date, Date)

AlTER TABLE Weight
Add DateConverted Date;

Update Weight 
SET DateConverted = CONVERT(Date, Date)


--Convert Weight Pounds and BMI column from a Float to a Integer
Select*
From CaseStudyProject..Weight

Update Weight 
SET WeightPounds = CONVERT(int, WeightPounds)

Update Weight 
SET BMI = CONVERT(int, BMI)


--Converting Manually Reported Column to Yes or No
Select*
From CaseStudyProject..Weight

Select ManuallyReported
,CASE	When ManuallyReported = '1' Then 'Yes'
		Else 'No' 
		End
From CaseStudyProject..Weight


--Least Weight vs Calories Burned

Select WeightPounds, CaloriesBurned
From CaseStudyProject..DailyActivity, CaseStudyProject..Weight
Order By WeightPounds Asc


--Most Weight vs Calories Burned

Select WeightPounds, CaloriesBurned
From CaseStudyProject..DailyActivity, CaseStudyProject..Weight
Order By WeightPounds Desc


--Clean Sleep Table
Select*
From CaseStudyProject..Sleep


--Change Date Format

Select SleepDayConverted, CONVERT(Date,SleepDay)
From CaseStudyProject..Sleep

Update Sleep
SET SleepDay = CONVERT(Date,SleepDay)

AlTER TABLE Sleep
Add SleepDayConverted Date;

Update Sleep 
SET SleepDayConverted = CONVERT(Date, SleepDay)


--Convert Hours Asleep column to Integer

Update Sleep 
SET HoursAsleep = CONVERT(int, HoursAsleep)


--Least Hours of Sleep vs Very Active Minutes

Select VeryActiveMinutes, HoursAsleep
From CaseStudyProject..DailyActivity, CaseStudyProject..Sleep
Order By HoursAsleep Asc


--Least Very Active Minutes vs Hours of Sleep

Select VeryActiveMinutes, HoursAsleep
From CaseStudyProject..DailyActivity, CaseStudyProject..Sleep
Order By VeryActiveMinutes Asc


--Comparing Active Distance, Active Minutes, Calories Burned, Weight, BMI, and Hours Asleep between Most  and Least Active Id's

Select *
From CaseStudyProject..IdComparisons


--Converting Decimals to Percents in Device Usage Table

Select*
From CaseStudyProject..DeviceUsage

Update DeviceUsage
SET UserUsage = CONVERT(decimal(3,2), UserUsage)*100