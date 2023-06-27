select
    cast(date_trunc('day', cal.date) as date) as date
    ,nullif(sum(amount), 0) as amount
from {{ source("helper", "calendar") }} cal
left join {{ source("src", "payment") }} payment
  on date_trunc('day', cal.date) = date_trunc('day', payment.payment_date)
where date_trunc('day', cal.date) between '2007-02-01' and '2007-05-31'
group by date_trunc('day', cal.date)
order by date_trunc('day', cal.date)
