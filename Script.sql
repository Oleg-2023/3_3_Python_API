WITH min_rate AS (SELECT 'min' AS grade,
       q."Date" AS "Date",
       q.rate AS rate
  FROM quotes_daily q
  ORDER BY q.rate  
  LIMIT(1)
  ), 
  max_rate AS (SELECT 'max' AS grade,
       q."Date" AS "Date",
       q.rate AS rate
  FROM quotes_daily q
  ORDER BY q.rate DESC 
  LIMIT(1)
  ),
  max_date AS (SELECT 'last' AS grade,
       q."Date" AS "Date",
       q.rate AS rate
  FROM quotes_daily q
  ORDER BY q."Date" DESC 
  LIMIT(1)
  )
  
SELECT * FROM min_rate  
UNION
  SELECT * FROM max_rate  
UNION
  SELECT * FROM max_date  
UNION
  SELECT 'avg' AS grade,
       NULL AS "Date",
       AVG(q.rate) AS rate
  FROM quotes_daily q
