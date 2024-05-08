-- google_merchandising.user_propensity source

CREATE OR REPLACE VIEW google_merchandising.user_propensity
AS SELECT DISTINCT ses.date,
    prod.fullvisitorid AS user_id,
    hit.is_transaction,
        CASE
            WHEN prod.isclick IS NULL THEN 0
            ELSE 1
        END AS is_click,
        CASE
            WHEN prod.isimpression IS NULL THEN 0
            ELSE 1
        END AS is_impression,
    COALESCE(max(hit.hitnumber), 0) AS hit_number,
    COALESCE(max(ses.trafficsource_istruedirect), 0) AS true_direct,
    COALESCE(max(ses.visitnumber), 0) AS visit_number,
    COALESCE(max(ses.totals_pageviews), 0) AS totals_pageviews,
    COALESCE(max(ses.totals_hits), 0) AS totals_hits,
    COALESCE(max(ses.totals_timeonsite), 0) AS totals_timeonsite
   FROM google_merchandising.products prod
     JOIN ( SELECT sessions.fullvisitorid,
            sessions.visitid,
            sessions.date::text::date AS date,
                CASE
                    WHEN sessions.trafficsource_istruedirect IS NULL THEN 0
                    ELSE 1
                END AS trafficsource_istruedirect,
            sessions.visitnumber,
            sessions.totals_pageviews,
            sessions.totals_hits,
            sessions.totals_timeonsite,
            sessions.totals_sessionqualitydim
           FROM google_merchandising.sessions) ses ON prod.fullvisitorid = ses.fullvisitorid AND prod.visitid = ses.visitid
     JOIN ( SELECT hits."fullVisitorId" AS fullvisitorid,
            hits."visitId" AS visitid,
            hits."hitNumber" AS hitnumber,
                CASE
                    WHEN hits."transaction_transactionId" IS NULL THEN 'no'::text
                    ELSE 'yes'::text
                END AS is_transaction
           FROM google_merchandising.hits) hit ON prod.fullvisitorid = hit.fullvisitorid AND prod.visitid = hit.visitid AND prod.hitnumber = hit.hitnumber
  GROUP BY ses.date, prod.fullvisitorid, ses.visitid, hit.is_transaction, (
        CASE
            WHEN prod.isclick IS NULL THEN 0
            ELSE 1
        END), (
        CASE
            WHEN prod.isimpression IS NULL THEN 0
            ELSE 1
        END)
  ORDER BY ses.date, prod.fullvisitorid;