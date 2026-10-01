WITH manhattan_violation_codes AS (
    SELECT
        violationcode as violation_code,
        violationdescription as definition,
        TRUE AS is_manhattan_96th_st_below,
        manhattanfine AS fee_usd,
    FROM
        {{ref('bronze_parking_violation_codes')}}
),

all_other_violation_codes AS (
    SELECT
        violationcode as violation_code,
        violationdescription as definition,
        FALSE AS is_manhattan_96th_st_below,
        otherfine AS fee_usd,
    FROM
        {{ref('bronze_parking_violation_codes')}}
)

SELECT * FROM manhattan_violation_codes
UNION ALL
SELECT * FROM all_other_violation_codes
ORDER BY violation_code ASC
