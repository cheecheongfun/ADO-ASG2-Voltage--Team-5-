select categoryID, 
    categoryName
From {{ ref ('raw_category')}}
