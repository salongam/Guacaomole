/****** Script for SelectTopNRows command from SSMS  ******/
/*all ARCH Weeks*/
SELECT distinct form_group_id, form_group_name, year(completed_date) x
  FROM [omedash].[dbo].[vw_reflection]
  where form_group_name like '%ARCH%' and section_label like '%SMART%'
  order by form_group_name, x

/*count students who completed*/
  select form_group_id, form_group_name, x, count(response_id) stu_count
  from 
  (
  SELECT form_group_id, form_group_name, year(completed_date) x, response_id
  FROM [omedash].[dbo].[vw_reflection]
  where form_group_name like '%ARCH%' and section_label like '%SMART%'
  group by form_group_id, form_group_name, year(completed_date), response_id
  )x
  group by form_group_id, form_group_name, x
  order by form_group_name, x

  select *, year(completed_date) x
  from omedash.dbo.vw_reflection
  where form_group_id = 7 and completed_date between '2017-01-01' and '2017-12-31' and section_label like '%SMART%'