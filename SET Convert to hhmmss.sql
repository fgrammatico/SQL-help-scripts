UPDATE [LinearLogs].[dbo].[LinearReports]
SET [Duration from file] = RIGHT('0' + CAST([Duration from file] / 3600 AS VARCHAR),2) + ':' +
RIGHT('0' + CAST(([Duration from file] / 60) % 60 AS VARCHAR),2) + ':' +
RIGHT('0' + CAST([Duration from file] % 60 AS VARCHAR),2)
WHERE [Means of entry] = 'TrakStak'
AND [Duration from file] NOT LIKE '%@%'