# Covid-19 Patient Tracker (Native iOS)
  
* The iOS application, which was purely built using Swift-5, provided administrative people to add patients details and track their Covid-19 Screening.
* Application was taking information from user and calculated priority level and waiting list accordingly.
* Priority Level-0 patients are considered as exempted patients, rest, all other patients, are given priority level and waiting number as per the number of patients in each level.
* In Pending Cases Screen, the user can click on the patient c=and can confirm if test for patient was successfully completed; if user accepts, then patient will be removed form the list, and if not, the user will remain in list until it is accepted.
* There were 4 levels of priority as follows: 
  1. If the patient's age is greater than 65 years and has recently travelled, then these types of patients were given highest priority as Level-3.
  2. If patient is older having an age greater than 65 years and has not travelled recently, were considered as the patients having priority Level-2.
  3. Patient has travelled recently and is younger than 65 years, than they dropped into Level-1 priority.
  4. Remaining patients, who have not reached 65 and has not travelled recently fell into the lowest priority Level-0.

***Screenshots***
1. *Patient Registration*
<img src="https://github.com/dishant9397/covid-19-patient-tracker/blob/master/Images/Patient%20Registration%20Screen.png" height="40%" width="40%"/>   
  
2. *Patient Details*
<img src="https://github.com/dishant9397/covid-19-patient-tracker/blob/master/Images/Patient%20Details%20Screen.png" height="40%" width="40%"/>
  
3. *Pending Cases*
<img src="https://github.com/dishant9397/covid-19-patient-tracker/blob/master/Images/Pending%20Cases%20Screen.png" height="40%" width="40%"/>
  
4. *Exempted Cases*
<img src="https://github.com/dishant9397/covid-19-patient-tracker/blob/master/Images/Exempted%20Cases%20Screen.png" height="40%" width="40%"/>
