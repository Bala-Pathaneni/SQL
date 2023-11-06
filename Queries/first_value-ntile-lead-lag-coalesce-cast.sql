-- 1. first_value(): FIRST_VALUE returns the value of the specified expression with respect to the first row in the window frame.
-- 2. ntile(): The NTILE window function divides ordered rows in the partition into the specified number of ranked groups of as equal size as possible and returns the group that a given row falls into. 
-- 3. lag():The LAG function is used to access data from PREVIOUS rows along with data from the current row.
-- 4. lead():The LEAD function is used to access data from SUBSEQUENT rows along with data from the current row.
-- 5. coalesce(): The coalesce function is used to handle the Null values. The null values are replaced with user-defined values during the expression evaluation process. 
-- 6. cast(): The cast function converts a value (of any type) into a specified datatype.

-- Create the "cats" table
CREATE TABLE cats (
    name VARCHAR(50),
    breed VARCHAR(50),
    weight DECIMAL(4, 1),
    color VARCHAR(50),
    age INT
);

-- Insert data into the "cats" table
INSERT INTO cats (name, breed, weight, color, age)
VALUES
    ('Ashes', 'Persian', 4.5, 'Black', 5),
    ('Molly', 'Persian', 4.2, 'Black', 1),
    ('Felix', 'Persian', 5.0, 'Tortoiseshell', 2),
    ('Smudge', 'British Shorthair', 4.9, 'Black', 4),
    ('Tigger', 'British Shorthair', 3.8, 'Tortoiseshell', 2),
    ('Alfie', 'Siamese', 5.5, 'Brown', 5),
    ('Oscar', 'Siamese', 6.1, 'Black', 1),
    ('Millie', 'Maine Coon', 5.4, 'Tortoiseshell', 5),
    ('Misty', 'Maine Coon', 5.7, 'Brown', 2),
    ('Puss', 'Maine Coon', 5.1, 'Tortoiseshell', 2),
    ('Smokey', 'Maine Coon', 6.1, 'Brown', 4),
    ('Charlie', 'British Shorthair', 4.8, 'Black', 4);

-- first_value( )
--Print cat name, color and the minimum weight of cats with that color.
select name, color, first_value(weight) over (partition by color order by weight) as weight_by_color 
from cats 
order by color,name

--ntile( )
--group the cats into quartiles by their weight.
select name, weight, ntile(4) over ( order by weight) as weight_quartile from cats order by weight

--lag( )
--Print a list of cats, their weights and the weight difference between them and the nearest lighter cat ordered by weight.
select name,weight,
lag(weight, 1) over (order by weight) as LAG,
weight-lag(weight, 1) over (order by weight) as LAG_weight_difference,
coalesce(weight-lag(weight, 1) over (order by weight),0) as LAG_weight_difference_no_nulls
from cats
order by weight

--lead( )
--Print a list of cats, their breeds, weights and the weight difference between them and the nearest lighter cat of the same breed.
select name,weight,
lag(weight, 1) over (partition by breed order by weight) as LAG,
weight-lag(weight, 1) over (partition by breed order by weight) as LAG_weight_difference,
coalesce(weight-lag(weight, 1) over (partition by breed order by weight),0) as LAG_weight_difference_no_nulls
from cats
order by weight

--first_value( )
--Print cat name, color and the minimum weight of cats with that color.
select name, color, first_value(weight) over (partition by color order by weight) as weight_by_color from cats order by color, name

--coalesce( ),cast( ),lead( )
--Print a list of cats, their weights and either the next heaviest cat's weight or 'fattest cat'
select name, weight,breed, coalesce(cast(lead(weight,1) over(partition by breed order by weight)as varchar),'fastest cat') as next_heaviest_cat_weight 
from cats
order by weight