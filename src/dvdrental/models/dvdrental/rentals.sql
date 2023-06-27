select
  rental.rental_id
  ,rental.rental_date
  ,rental.inventory_id
  ,inventory.film_id
  ,film.title
  ,film.description
  ,film.release_year
  ,film.language_id
  ,film.rental_duration
  ,film.rental_rate
  ,film.length
  ,film.replacement_cost
  ,film.rating
  ,film.last_update as film_last_update
  ,film.special_features
  ,film.fulltext
  ,rental.customer_id
  ,customer.store_id
  ,customer.first_name
  ,customer.last_name
  ,customer.email
  ,customer.address_id
  ,customer.activebool
  ,customer.create_date
  ,customer.last_update as customer_last_update
  ,customer.active
  ,rental.return_date
  ,rental.staff_id
  ,rental.last_update as rental_last_update
from {{ source('src', 'rental') }} rental
left join {{ source('src', 'inventory') }} inventory
  on rental.inventory_id = inventory.inventory_id
left join {{ source('src', 'film') }} film
  on inventory.film_id = film.film_id
left join {{ source('src', 'store') }} store
  on inventory.store_id = store.store_id
left join {{ source('src', 'customer') }} customer
  on rental.customer_id = customer.customer_id
left join {{ source('src', 'address') }} address
  on customer.address_id = address.address_id
left join {{ source('src', 'staff') }} staff
  on rental.staff_id = staff.staff_id
