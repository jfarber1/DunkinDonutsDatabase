use DunkinDonuts 

Select * from Customer ;
Select * from Store ;
Select * from CreditCard ;
Select * from FoodMenu ;
Select * from MenuItems ;
Select * from OrderDetail ;
Select * from OrderHeader ;
Select * from SeasonalMenu ;
Select * from Employee ;
Select * from DrinkMenu ;


/* What is the last name of each store's manager? */ 
 Select s.StoreID, s.storeName, e.LastName, e.IsStoreManager
 From Store as s inner join employee as e on s.StoreID= e.StoreID
  where IsStoreManager = 1 ; 


/* Total amount of calories and price of small cold drinks*/ 
Select DrinkID, DrinkName, sum(DrinkCalories) as DrinkCalories, SmallPrice 
From DrinkMenu
where DrinkCategory = 'cold' 
group by DrinkName, DrinkID, ; 

/* Find the food Name and what season it is introduced in stores */ 
 select f.FoodName,f.isSeasonal, s.Season
 from FoodMenu as f left outer join SeasonalMenu as s on f.SeasonalID=s.SeasonalID
 ; 
  /* we chose to do a left outer join since we wanted the backbone of the query to be
  base of whether or not the Food was on the food menu first even though it may not be seasonal. 
*/ 

 /*subquery, For people who are into fitness we want to display the healthier options. We used a subquery to show the food menu items that contain foods with less calories than one of the healthier options; the turkey sausage flatbread. */
select FoodID, FoodName, FoodCaloroies
from FoodMenu
where FoodCalories < (select FoodCalories from FoodMenu where FoodName LIKE 'Turkey Sausage Flatbread');




