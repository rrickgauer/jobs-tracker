# Job search database tables


Users

* id
* name_first
* name_last
* email
* password



Applications

* id
* user_id
* company_id
* job_title
* job_description
* compensation_amount (62,500, 34)
* compensation_interval (annual, hour, etc...)
* date_applied
* data_recorded
* application_status
* location_address_1
* location_address_2
* location_city
* location_state
* location_zip



Companies

* id
* user_id
* name
* location


Application_Appointments

* id
* application_id
* time_start
* time_end
* location_address_1
* location_address_2
* location_city
* location_state
* location_zip
* note

Application_Notes

* id
* date_recorded
* content




