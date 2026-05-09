DROP DATABASE IF EXISTS zhejiang_income_analysis;
CREATE DATABASE zhejiang_income_analysis
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE zhejiang_income_analysis;

-- =========================================================
-- 1. 创建居民收入明细表
-- =========================================================

CREATE TABLE resident_income_detail (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    year INT NOT NULL COMMENT '年份',
    resident_group VARCHAR(20) NOT NULL COMMENT '居民分组代码：all全体，urban城镇，rural农村',
    resident_group_cn VARCHAR(50) NOT NULL COMMENT '居民分组中文名称',
    metric_code VARCHAR(50) NOT NULL COMMENT '指标代码',
    metric_name VARCHAR(100) NOT NULL COMMENT '指标中文名称',
    amount_yuan DECIMAL(12,2) NOT NULL COMMENT '金额，单位：元',
    data_source VARCHAR(255) NOT NULL COMMENT '数据来源',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    INDEX idx_year_group (year, resident_group),
    INDEX idx_metric_code (metric_code)
) COMMENT='浙江省居民人均可支配收入及收入结构明细表';

-- =========================================================
-- 2. 插入收入数据
-- 数据来源：浙江省统计局 2025年浙江统计年鉴 表5-5
-- =========================================================

INSERT INTO resident_income_detail
(year, resident_group, resident_group_cn, metric_code, metric_name, amount_yuan, data_source)
VALUES
(2022, 'all', '全体居民', 'disposable_income', '可支配收入', 60302, '2025年浙江统计年鉴 表5-5'),
(2023, 'all', '全体居民', 'disposable_income', '可支配收入', 63830, '2025年浙江统计年鉴 表5-5'),
(2024, 'all', '全体居民', 'disposable_income', '可支配收入', 67013, '2025年浙江统计年鉴 表5-5'),

(2022, 'urban', '城镇常住居民', 'disposable_income', '可支配收入', 71268, '2025年浙江统计年鉴 表5-5'),
(2023, 'urban', '城镇常住居民', 'disposable_income', '可支配收入', 74997, '2025年浙江统计年鉴 表5-5'),
(2024, 'urban', '城镇常住居民', 'disposable_income', '可支配收入', 78251, '2025年浙江统计年鉴 表5-5'),

(2022, 'rural', '农村常住居民', 'disposable_income', '可支配收入', 37565, '2025年浙江统计年鉴 表5-5'),
(2023, 'rural', '农村常住居民', 'disposable_income', '可支配收入', 40311, '2025年浙江统计年鉴 表5-5'),
(2024, 'rural', '农村常住居民', 'disposable_income', '可支配收入', 42786, '2025年浙江统计年鉴 表5-5'),

(2022, 'all', '全体居民', 'wage_income', '工资性收入', 34177, '2025年浙江统计年鉴 表5-5'),
(2023, 'all', '全体居民', 'wage_income', '工资性收入', 35769, '2025年浙江统计年鉴 表5-5'),
(2024, 'all', '全体居民', 'wage_income', '工资性收入', 37220, '2025年浙江统计年鉴 表5-5'),

(2022, 'urban', '城镇常住居民', 'wage_income', '工资性收入', 39718, '2025年浙江统计年鉴 表5-5'),
(2023, 'urban', '城镇常住居民', 'wage_income', '工资性收入', 41439, '2025年浙江统计年鉴 表5-5'),
(2024, 'urban', '城镇常住居民', 'wage_income', '工资性收入', 42845, '2025年浙江统计年鉴 表5-5'),

(2022, 'rural', '农村常住居民', 'wage_income', '工资性收入', 22687, '2025年浙江统计年鉴 表5-5'),
(2023, 'rural', '农村常住居民', 'wage_income', '工资性收入', 23825, '2025年浙江统计年鉴 表5-5'),
(2024, 'rural', '农村常住居民', 'wage_income', '工资性收入', 25094, '2025年浙江统计年鉴 表5-5'),

(2022, 'all', '全体居民', 'business_net_income', '经营净收入', 9880, '2025年浙江统计年鉴 表5-5'),
(2023, 'all', '全体居民', 'business_net_income', '经营净收入', 10664, '2025年浙江统计年鉴 表5-5'),
(2024, 'all', '全体居民', 'business_net_income', '经营净收入', 11423, '2025年浙江统计年鉴 表5-5'),

(2022, 'urban', '城镇常住居民', 'business_net_income', '经营净收入', 10233, '2025年浙江统计年鉴 表5-5'),
(2023, 'urban', '城镇常住居民', 'business_net_income', '经营净收入', 10833, '2025年浙江统计年鉴 表5-5'),
(2024, 'urban', '城镇常住居民', 'business_net_income', '经营净收入', 11566, '2025年浙江统计年鉴 表5-5'),

(2022, 'rural', '农村常住居民', 'business_net_income', '经营净收入', 9149, '2025年浙江统计年鉴 表5-5'),
(2023, 'rural', '农村常住居民', 'business_net_income', '经营净收入', 10307, '2025年浙江统计年鉴 表5-5'),
(2024, 'rural', '农村常住居民', 'business_net_income', '经营净收入', 11115, '2025年浙江统计年鉴 表5-5'),

(2022, 'all', '全体居民', 'property_net_income', '财产净收入', 7397, '2025年浙江统计年鉴 表5-5'),
(2023, 'all', '全体居民', 'property_net_income', '财产净收入', 7783, '2025年浙江统计年鉴 表5-5'),
(2024, 'all', '全体居民', 'property_net_income', '财产净收入', 8103, '2025年浙江统计年鉴 表5-5'),

(2022, 'urban', '城镇常住居民', 'property_net_income', '财产净收入', 10397, '2025年浙江统计年鉴 表5-5'),
(2023, 'urban', '城镇常住居民', 'property_net_income', '财产净收入', 10880, '2025年浙江统计年鉴 表5-5'),
(2024, 'urban', '城镇常住居民', 'property_net_income', '财产净收入', 11252, '2025年浙江统计年鉴 表5-5'),

(2022, 'rural', '农村常住居民', 'property_net_income', '财产净收入', 1177, '2025年浙江统计年鉴 表5-5'),
(2023, 'rural', '农村常住居民', 'property_net_income', '财产净收入', 1259, '2025年浙江统计年鉴 表5-5'),
(2024, 'rural', '农村常住居民', 'property_net_income', '财产净收入', 1316, '2025年浙江统计年鉴 表5-5'),

(2022, 'all', '全体居民', 'transfer_net_income', '转移净收入', 8848, '2025年浙江统计年鉴 表5-5'),
(2023, 'all', '全体居民', 'transfer_net_income', '转移净收入', 9615, '2025年浙江统计年鉴 表5-5'),
(2024, 'all', '全体居民', 'transfer_net_income', '转移净收入', 10266, '2025年浙江统计年鉴 表5-5'),

(2022, 'urban', '城镇常住居民', 'transfer_net_income', '转移净收入', 10919, '2025年浙江统计年鉴 表5-5'),
(2023, 'urban', '城镇常住居民', 'transfer_net_income', '转移净收入', 11844, '2025年浙江统计年鉴 表5-5'),
(2024, 'urban', '城镇常住居民', 'transfer_net_income', '转移净收入', 12588, '2025年浙江统计年鉴 表5-5'),

(2022, 'rural', '农村常住居民', 'transfer_net_income', '转移净收入', 4552, '2025年浙江统计年鉴 表5-5'),
(2023, 'rural', '农村常住居民', 'transfer_net_income', '转移净收入', 4920, '2025年浙江统计年鉴 表5-5'),
(2024, 'rural', '农村常住居民', 'transfer_net_income', '转移净收入', 5262, '2025年浙江统计年鉴 表5-5');

-- =========================================================
-- 3. 创建居民消费支出明细表
-- =========================================================

CREATE TABLE resident_consumption_detail (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    year INT NOT NULL COMMENT '年份',
    resident_group VARCHAR(20) NOT NULL COMMENT '居民分组代码：all全体，urban城镇，rural农村',
    resident_group_cn VARCHAR(50) NOT NULL COMMENT '居民分组中文名称',
    metric_code VARCHAR(50) NOT NULL COMMENT '指标代码',
    metric_name VARCHAR(100) NOT NULL COMMENT '指标中文名称',
    amount_yuan DECIMAL(12,2) NOT NULL COMMENT '金额，单位：元',
    data_source VARCHAR(255) NOT NULL COMMENT '数据来源',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    INDEX idx_year_group (year, resident_group),
    INDEX idx_metric_code (metric_code)
) COMMENT='浙江省居民人均生活消费支出明细表';

-- =========================================================
-- 4. 插入消费支出数据
-- 数据来源：浙江省统计局 2025年浙江统计年鉴 表5-9
-- =========================================================

INSERT INTO resident_consumption_detail
(year, resident_group, resident_group_cn, metric_code, metric_name, amount_yuan, data_source)
VALUES
(2022, 'all', '全体居民', 'consumption_expenditure', '生活消费支出', 38971, '2025年浙江统计年鉴 表5-9'),
(2023, 'all', '全体居民', 'consumption_expenditure', '生活消费支出', 42194, '2025年浙江统计年鉴 表5-9'),
(2024, 'all', '全体居民', 'consumption_expenditure', '生活消费支出', 45107, '2025年浙江统计年鉴 表5-9'),

(2022, 'urban', '城镇常住居民', 'consumption_expenditure', '生活消费支出', 44511, '2025年浙江统计年鉴 表5-9'),
(2023, 'urban', '城镇常住居民', 'consumption_expenditure', '生活消费支出', 47762, '2025年浙江统计年鉴 表5-9'),
(2024, 'urban', '城镇常住居民', 'consumption_expenditure', '生活消费支出', 50704, '2025年浙江统计年鉴 表5-9'),

(2022, 'rural', '农村常住居民', 'consumption_expenditure', '生活消费支出', 27483, '2025年浙江统计年鉴 表5-9'),
(2023, 'rural', '农村常住居民', 'consumption_expenditure', '生活消费支出', 30468, '2025年浙江统计年鉴 表5-9'),
(2024, 'rural', '农村常住居民', 'consumption_expenditure', '生活消费支出', 33043, '2025年浙江统计年鉴 表5-9');

-- =========================================================
-- 5. 创建收入分析视图
-- 功能：把长表转成适合分析的宽表
-- =========================================================

CREATE OR REPLACE VIEW v_income_analysis AS
SELECT
    year,
    MAX(CASE WHEN resident_group = 'all' THEN amount_yuan END) AS all_income,
    MAX(CASE WHEN resident_group = 'urban' THEN amount_yuan END) AS urban_income,
    MAX(CASE WHEN resident_group = 'rural' THEN amount_yuan END) AS rural_income,
    MAX(CASE WHEN resident_group = 'urban' THEN amount_yuan END)
      - MAX(CASE WHEN resident_group = 'rural' THEN amount_yuan END) AS income_gap,
    ROUND(
        MAX(CASE WHEN resident_group = 'urban' THEN amount_yuan END)
        / MAX(CASE WHEN resident_group = 'rural' THEN amount_yuan END),
        4
    ) AS income_ratio
FROM resident_income_detail
WHERE metric_code = 'disposable_income'
GROUP BY year;

-- =========================================================
-- 6. 查询收入趋势
-- =========================================================

SELECT
    year,
    all_income,
    urban_income,
    rural_income,
    income_gap,
    income_ratio
FROM v_income_analysis
ORDER BY year;

-- =========================================================
-- 7. 使用窗口函数计算同比增长率
-- 功能：LAG() 获取上一年收入
-- =========================================================

WITH income_growth AS (
    SELECT
        year,
        resident_group,
        resident_group_cn,
        amount_yuan AS disposable_income,
        LAG(amount_yuan) OVER (
            PARTITION BY resident_group
            ORDER BY year
        ) AS last_year_income
    FROM resident_income_detail
    WHERE metric_code = 'disposable_income'
)
SELECT
    year,
    resident_group,
    resident_group_cn,
    disposable_income,
    last_year_income,
    ROUND((disposable_income / last_year_income - 1) * 100, 2) AS growth_rate_percent
FROM income_growth
ORDER BY resident_group, year;

-- =========================================================
-- 8. 比较城镇和农村收入增长率
-- =========================================================

WITH growth_data AS (
    SELECT
        year,
        resident_group,
        amount_yuan,
        ROUND(
            (amount_yuan / LAG(amount_yuan) OVER (
                PARTITION BY resident_group
                ORDER BY year
            ) - 1) * 100,
            2
        ) AS growth_rate_percent
    FROM resident_income_detail
    WHERE metric_code = 'disposable_income'
)
SELECT
    year,
    MAX(CASE WHEN resident_group = 'urban' THEN growth_rate_percent END) AS urban_growth_rate,
    MAX(CASE WHEN resident_group = 'rural' THEN growth_rate_percent END) AS rural_growth_rate,
    MAX(CASE WHEN resident_group = 'rural' THEN growth_rate_percent END)
      - MAX(CASE WHEN resident_group = 'urban' THEN growth_rate_percent END) AS rural_minus_urban_growth
FROM growth_data
GROUP BY year
ORDER BY year;

-- =========================================================
-- 9. 收入结构占比分析
-- 功能：计算工资性收入、经营净收入、财产净收入、转移净收入占可支配收入比重
-- =========================================================

WITH total_income AS (
    SELECT
        year,
        resident_group,
        amount_yuan AS disposable_income
    FROM resident_income_detail
    WHERE metric_code = 'disposable_income'
)
SELECT
    d.year,
    d.resident_group,
    d.resident_group_cn,
    d.metric_name,
    d.amount_yuan,
    ROUND(d.amount_yuan / t.disposable_income * 100, 2) AS share_percent
FROM resident_income_detail d
JOIN total_income t
  ON d.year = t.year
 AND d.resident_group = t.resident_group
WHERE d.metric_code IN (
    'wage_income',
    'business_net_income',
    'property_net_income',
    'transfer_net_income'
)
ORDER BY d.year, d.resident_group, share_percent DESC;

-- =========================================================
-- 10. 收支结余与平均消费倾向分析
-- =========================================================

WITH income AS (
    SELECT
        year,
        resident_group,
        resident_group_cn,
        amount_yuan AS disposable_income
    FROM resident_income_detail
    WHERE metric_code = 'disposable_income'
),
consumption AS (
    SELECT
        year,
        resident_group,
        amount_yuan AS consumption_expenditure
    FROM resident_consumption_detail
    WHERE metric_code = 'consumption_expenditure'
)
SELECT
    i.year,
    i.resident_group,
    i.resident_group_cn,
    i.disposable_income,
    c.consumption_expenditure,
    i.disposable_income - c.consumption_expenditure AS balance,
    ROUND(c.consumption_expenditure / i.disposable_income * 100, 2) AS consumption_propensity_percent
FROM income i
JOIN consumption c
  ON i.year = c.year
 AND i.resident_group = c.resident_group
ORDER BY i.year, i.resident_group;