-- google_merchandising.table_comparisons source

CREATE OR REPLACE VIEW google_merchandising.table_comparisons
AS SELECT 'sessions'::text AS source,
    count(DISTINCT sessions.visitid) AS sessions,
    sum(sessions.totals_transactions) AS transactions,
    sum(sessions.totals_totaltransactionrevenue::numeric / 1000000::numeric) AS revenue
   FROM google_merchandising.sessions
UNION ALL
 SELECT 'hits'::text AS source,
    count(DISTINCT hits."visitId") AS sessions,
    count(DISTINCT hits."transaction_transactionId") AS transactions,
    sum(hits."transaction_transactionRevenue"::numeric / 1000000::numeric) AS revenue
   FROM google_merchandising.hits
UNION ALL
 SELECT 'products'::text AS source,
    NULL::bigint AS sessions,
    NULL::bigint AS transactions,
    sum(products.productrevenue / 1000000::numeric) AS revenue
   FROM google_merchandising.products
  WHERE products.productrevenue IS NOT NULL;