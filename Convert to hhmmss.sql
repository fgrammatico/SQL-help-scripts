SELECT RIGHT('0' + CAST([Duration from file] / 3600 AS VARCHAR),2) + ':' +
RIGHT('0' + CAST(([Duration from file] / 60) % 60 AS VARCHAR),2) + ':' +
RIGHT('0' + CAST([Duration from file] % 60 AS VARCHAR),2)
FROM [LinearLogs].[dbo].[TESTLinearReports]
  WHERE [Means of entry] = 'TrakStak'
  AND [Duration from file] NOT LIKE '%@%'
