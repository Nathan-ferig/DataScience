-- google_merchandising.user_segmentation source

CREATE OR REPLACE VIEW google_merchandising.user_segmentation
AS SELECT ses.date,
    prod.fullvisitorid AS user_id,
    prod.visitid AS session_id,
    ses.channelgrouping AS channel,
    ses.geonetwork_country AS country,
    prod.productsku AS product_sku,
        CASE
            WHEN prod.v2productcategory ~~ '%/%'::text THEN reverse(split_part(reverse(prod.v2productcategory), '/'::text, 2))
            ELSE prod.v2productcategory
        END AS product_category,
    hit.is_transaction,
    hit.transactionid AS transaction_id,
    COALESCE(sum(prod.productrevenue / 1000000::numeric), 0::numeric) AS revenue
   FROM google_merchandising.products prod
     JOIN ( SELECT sessions.fullvisitorid,
            sessions.visitid,
            sessions.geonetwork_country,
            sessions.channelgrouping,
            max(sessions.date::text::date) AS date
           FROM google_merchandising.sessions
          GROUP BY sessions.fullvisitorid, sessions.visitid, sessions.geonetwork_country, sessions.channelgrouping) ses ON prod.fullvisitorid = ses.fullvisitorid AND prod.visitid = ses.visitid
     JOIN ( SELECT hits."fullVisitorId" AS fullvisitorid,
            hits."visitId" AS visitid,
            hits."hitNumber" AS hitnumber,
                CASE
                    WHEN hits."transaction_transactionId" IS NULL THEN 'no'::text
                    ELSE 'yes'::text
                END AS is_transaction,
            hits."transaction_transactionId" AS transactionid
           FROM google_merchandising.hits) hit ON prod.fullvisitorid = hit.fullvisitorid AND prod.visitid = hit.visitid AND prod.hitnumber = hit.hitnumber
  GROUP BY ses.date, prod.fullvisitorid, prod.visitid, ses.channelgrouping, ses.geonetwork_country, prod.productsku, (
        CASE
            WHEN prod.v2productcategory ~~ '%/%'::text THEN reverse(split_part(reverse(prod.v2productcategory), '/'::text, 2))
            ELSE prod.v2productcategory
        END), hit.is_transaction, hit.transactionid
  ORDER BY ses.date, prod.fullvisitorid, hit.transactionid;