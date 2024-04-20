SELECT *
  FROM [LinearLogs].[dbo].[LinearReports]
  WHERE [Job Completed] = '06/10/2016 10:04'
 /**AND [Means of entry] = 'Direct_To_Ingest_HD'***/
ORDER BY [Job Completed] ASC