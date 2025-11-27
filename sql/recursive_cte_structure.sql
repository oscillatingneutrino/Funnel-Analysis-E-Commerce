-- From google
-- might need, or maybe use LAG instead

WITH RECURSIVE <cte_name> AS (
    -- Anchor Member (Base Term)
    SELECT <columns>
    FROM <initial_source>
    WHERE <initial_condition>

    UNION ALL

    -- Recursive Member
    SELECT <columns>
    FROM <cte_name>  -- References the CTE itself
    JOIN <other_tables> ON <join_condition>
    WHERE <termination_condition>
)
SELECT <columns>
FROM <cte_name>;
