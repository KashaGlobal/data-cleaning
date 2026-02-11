-- Facility cleanup SQL (name + government_facility_code).
-- Target: staging
-- No commit (dry-run): ./.venv/bin/python src/run_facility_name_update_sql.py --target staging
-- With commit (apply): ./.venv/bin/python src/run_facility_name_update_sql.py --target staging --apply
-- For production, replace `staging` with `production`.

START TRANSACTION;

UPDATE facilities
SET government_facility_code = '13461'
WHERE BINARY facility_name = BINARY 'Abidha Health Centre' AND COALESCE(government_facility_code, '') <> '13461';

UPDATE facilities
SET facility_name = 'AHF Mathare Blue House Clinic', government_facility_code = '12885'
WHERE BINARY facility_name = BINARY 'AHF Mathare Site' AND (BINARY facility_name <> BINARY 'AHF Mathare Blue House Clinic' OR COALESCE(government_facility_code, '') <> '12885');

UPDATE facilities
SET government_facility_code = '12885'
WHERE BINARY facility_name = BINARY 'AHF Mathare Blue House Clinic' AND COALESCE(government_facility_code, '') <> '12885';

UPDATE facilities
SET facility_name = 'AHF Parklands Clinic', government_facility_code = '20736'
WHERE BINARY facility_name = BINARY 'AIDS Health Care Foundation Parklands Clinic' AND (BINARY facility_name <> BINARY 'AHF Parklands Clinic' OR COALESCE(government_facility_code, '') <> '20736');

UPDATE facilities
SET government_facility_code = '20736'
WHERE BINARY facility_name = BINARY 'AHF Parklands Clinic' AND COALESCE(government_facility_code, '') <> '20736';

UPDATE facilities
SET government_facility_code = '13471'
WHERE BINARY facility_name = BINARY 'Akala Health Centre' AND COALESCE(government_facility_code, '') <> '13471';

UPDATE facilities
SET government_facility_code = '13476'
WHERE BINARY facility_name = BINARY 'Ambira Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '13476';

UPDATE facilities
SET facility_name = 'Amoyo Dispensary', government_facility_code = '16768'
WHERE BINARY facility_name = BINARY 'Amoyo Health Center' AND (BINARY facility_name <> BINARY 'Amoyo Dispensary' OR COALESCE(government_facility_code, '') <> '16768');

UPDATE facilities
SET government_facility_code = '16768'
WHERE BINARY facility_name = BINARY 'Amoyo Dispensary' AND COALESCE(government_facility_code, '') <> '16768';

UPDATE facilities
SET government_facility_code = '11920'
WHERE BINARY facility_name = BINARY 'Approved School Dispensary (Machakos)' AND COALESCE(government_facility_code, '') <> '11920';

UPDATE facilities
SET facility_name = 'St Assisi Sisters of Mary Immaculate Nursing Home', government_facility_code = '12745'
WHERE BINARY facility_name = BINARY 'Assisi Nursing Home' AND (BINARY facility_name <> BINARY 'St Assisi Sisters of Mary Immaculate Nursing Home' OR COALESCE(government_facility_code, '') <> '12745');

UPDATE facilities
SET government_facility_code = '12745'
WHERE BINARY facility_name = BINARY 'St Assisi Sisters of Mary Immaculate Nursing Home' AND COALESCE(government_facility_code, '') <> '12745';

UPDATE facilities
SET government_facility_code = '13488'
WHERE BINARY facility_name = BINARY 'Asumbi Mission Hospital' AND COALESCE(government_facility_code, '') <> '13488';

UPDATE facilities
SET government_facility_code = '14224'
WHERE BINARY facility_name = BINARY 'Bahati Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '14224';

UPDATE facilities
SET government_facility_code = '11239'
WHERE BINARY facility_name = BINARY 'Bamburi Dispensary' AND COALESCE(government_facility_code, '') <> '11239';

UPDATE facilities
SET government_facility_code = '13496'
WHERE BINARY facility_name = BINARY 'Bar Agulu Dispensary' AND COALESCE(government_facility_code, '') <> '13496';

UPDATE facilities
SET government_facility_code = '16667'
WHERE BINARY facility_name = BINARY 'Beacon of Hope Clinic (Ongata Rongai)' AND COALESCE(government_facility_code, '') <> '16667';

UPDATE facilities
SET facility_name = 'Bishop Kioko Catholic Hospital', government_facility_code = '11955'
WHERE BINARY facility_name = BINARY 'Bishop Kioko CH' AND (BINARY facility_name <> BINARY 'Bishop Kioko Catholic Hospital' OR COALESCE(government_facility_code, '') <> '11955');

UPDATE facilities
SET government_facility_code = '11955'
WHERE BINARY facility_name = BINARY 'Bishop Kioko Catholic Hospital' AND COALESCE(government_facility_code, '') <> '11955';

UPDATE facilities
SET government_facility_code = '14259'
WHERE BINARY facility_name = BINARY 'Bissil Health Centre' AND COALESCE(government_facility_code, '') <> '14259';

UPDATE facilities
SET government_facility_code = '14261'
WHERE BINARY facility_name = BINARY 'Bomet Health Centre' AND COALESCE(government_facility_code, '') <> '14261';

UPDATE facilities
SET government_facility_code = '33426'
WHERE BINARY facility_name = BINARY 'Bomu Hospital Bombolulu' AND COALESCE(government_facility_code, '') <> '33426';

UPDATE facilities
SET facility_name = 'Bomu Medical Clinic Old Town', government_facility_code = '27408'
WHERE BINARY facility_name = BINARY 'Bomu Medical Center -Old Town' AND (BINARY facility_name <> BINARY 'Bomu Medical Clinic Old Town' OR COALESCE(government_facility_code, '') <> '27408');

UPDATE facilities
SET government_facility_code = '27408'
WHERE BINARY facility_name = BINARY 'Bomu Medical Clinic Old Town' AND COALESCE(government_facility_code, '') <> '27408';

UPDATE facilities
SET government_facility_code = '11259'
WHERE BINARY facility_name = BINARY 'Bomu Medical Centre (Likoni)' AND COALESCE(government_facility_code, '') <> '11259';

UPDATE facilities
SET government_facility_code = '11258'
WHERE BINARY facility_name = BINARY 'Bomu Medical Hospital (Changamwe)' AND COALESCE(government_facility_code, '') <> '11258';

UPDATE facilities
SET government_facility_code = '13507'
WHERE BINARY facility_name = BINARY 'Bondo County Referral Hospital' AND COALESCE(government_facility_code, '') <> '13507';

UPDATE facilities
SET government_facility_code = '11273'
WHERE BINARY facility_name = BINARY 'Cdc Ganjoni Dispensary' AND COALESCE(government_facility_code, '') <> '11273';

UPDATE facilities
SET facility_name = 'Chaani Catholic', government_facility_code = '23285'
WHERE BINARY facility_name = BINARY 'Chaani Catholic Dispensary' AND (BINARY facility_name <> BINARY 'Chaani Catholic' OR COALESCE(government_facility_code, '') <> '23285');

UPDATE facilities
SET government_facility_code = '23285'
WHERE BINARY facility_name = BINARY 'Chaani Catholic' AND COALESCE(government_facility_code, '') <> '23285';

UPDATE facilities
SET government_facility_code = '14304'
WHERE BINARY facility_name = BINARY 'Chebunyo Dispensary' AND COALESCE(government_facility_code, '') <> '14304';

UPDATE facilities
SET government_facility_code = '11289'
WHERE BINARY facility_name = BINARY 'Coast General Teaching and Referral Hospital' AND COALESCE(government_facility_code, '') <> '11289';

UPDATE facilities
SET government_facility_code = '11274'
WHERE BINARY facility_name = BINARY 'Coast General Teaching and Referral Hospital (Chaani Outreach Centre)' AND COALESCE(government_facility_code, '') <> '11274';

UPDATE facilities
SET government_facility_code = '24618'
WHERE BINARY facility_name = BINARY 'Dice icl bomet' AND COALESCE(government_facility_code, '') <> '24618';

UPDATE facilities
SET facility_name = 'Ekalakala Health Centre', government_facility_code = '11995'
WHERE BINARY facility_name = BINARY 'Ekalakala HC' AND (BINARY facility_name <> BINARY 'Ekalakala Health Centre' OR COALESCE(government_facility_code, '') <> '11995');

UPDATE facilities
SET government_facility_code = '11995'
WHERE BINARY facility_name = BINARY 'Ekalakala Health Centre' AND COALESCE(government_facility_code, '') <> '11995';

UPDATE facilities
SET government_facility_code = '11995'
WHERE BINARY facility_name = BINARY 'Ekalakala Health Centre' AND COALESCE(government_facility_code, '') <> '11995';

UPDATE facilities
SET government_facility_code = '14431'
WHERE BINARY facility_name = BINARY 'Elburgon Sub County Hospital' AND COALESCE(government_facility_code, '') <> '14431';

UPDATE facilities
SET government_facility_code = '14498'
WHERE BINARY facility_name = BINARY 'Fitc Dispensary' AND COALESCE(government_facility_code, '') <> '14498';

UPDATE facilities
SET government_facility_code = '14510'
WHERE BINARY facility_name = BINARY 'Gilgil Sub County Hospital' AND COALESCE(government_facility_code, '') <> '14510';

UPDATE facilities
SET government_facility_code = '12048'
WHERE BINARY facility_name = BINARY 'GK Prison Dispensary (Machakos)' AND COALESCE(government_facility_code, '') <> '12048';

UPDATE facilities
SET government_facility_code = '13581'
WHERE BINARY facility_name = BINARY 'Gobei Health Centre' AND COALESCE(government_facility_code, '') <> '13581';

UPDATE facilities
SET government_facility_code = '13585'
WHERE BINARY facility_name = BINARY 'Godbura Health Centre' AND COALESCE(government_facility_code, '') <> '13585';

UPDATE facilities
SET government_facility_code = '17747'
WHERE BINARY facility_name = BINARY 'Good Shepherd Ang''iya' AND COALESCE(government_facility_code, '') <> '17747';

UPDATE facilities
SET facility_name = 'Holy Family Oriang Mission Dispensary', government_facility_code = '13604'
WHERE BINARY facility_name = BINARY 'Holy Family Oriang Health Centre 3A' AND (BINARY facility_name <> BINARY 'Holy Family Oriang Mission Dispensary' OR COALESCE(government_facility_code, '') <> '13604');

UPDATE facilities
SET government_facility_code = '13604'
WHERE BINARY facility_name = BINARY 'Holy Family Oriang Mission Dispensary' AND COALESCE(government_facility_code, '') <> '13604';

UPDATE facilities
SET government_facility_code = '13608'
WHERE BINARY facility_name = BINARY 'Homa Bay County Teaching and Referral Hospital' AND COALESCE(government_facility_code, '') <> '13608';

UPDATE facilities
SET government_facility_code = '13606'
WHERE BINARY facility_name = BINARY 'Homa Hills Health Centre' AND COALESCE(government_facility_code, '') <> '13606';

UPDATE facilities
SET government_facility_code = '14582'
WHERE BINARY facility_name = BINARY 'Isinya Health Centre' AND COALESCE(government_facility_code, '') <> '14582';

UPDATE facilities
SET government_facility_code = '14551'
WHERE BINARY facility_name = BINARY 'James Finlays Naivasha (South Lake Medical Center)' AND COALESCE(government_facility_code, '') <> '14551';

UPDATE facilities
SET government_facility_code = '11436'
WHERE BINARY facility_name = BINARY 'Jomvu Model Health Centre' AND COALESCE(government_facility_code, '') <> '11436';

UPDATE facilities
SET government_facility_code = '14652'
WHERE BINARY facility_name = BINARY 'Kajiado County Referral Hospital' AND COALESCE(government_facility_code, '') <> '14652';

UPDATE facilities
SET facility_name = 'Kandiege Sub-County Hospital', government_facility_code = '13653'
WHERE BINARY facility_name = BINARY 'Kandiege Sub-District Hospital' AND (BINARY facility_name <> BINARY 'Kandiege Sub-County Hospital' OR COALESCE(government_facility_code, '') <> '13653');

UPDATE facilities
SET government_facility_code = '13653'
WHERE BINARY facility_name = BINARY 'Kandiege Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '13653';

UPDATE facilities
SET government_facility_code = '12177'
WHERE BINARY facility_name = BINARY 'Kangundo Sub county Hospital' AND COALESCE(government_facility_code, '') <> '12177';

UPDATE facilities
SET government_facility_code = '14728'
WHERE BINARY facility_name = BINARY 'Kapkoros Sub-county hospital' AND COALESCE(government_facility_code, '') <> '14728';

UPDATE facilities
SET government_facility_code = '14733'
WHERE BINARY facility_name = BINARY 'Kapkures Health Centre (Nakuru west)' AND COALESCE(government_facility_code, '') <> '14733';

UPDATE facilities
SET government_facility_code = '14741'
WHERE BINARY facility_name = BINARY 'Kaplong Hospital' AND COALESCE(government_facility_code, '') <> '14741';

UPDATE facilities
SET government_facility_code = '14801'
WHERE BINARY facility_name = BINARY 'Karagita Health Centre' AND COALESCE(government_facility_code, '') <> '14801';

UPDATE facilities
SET government_facility_code = '12215'
WHERE BINARY facility_name = BINARY 'Katangi Health Centre' AND COALESCE(government_facility_code, '') <> '12215';

UPDATE facilities
SET government_facility_code = '12230'
WHERE BINARY facility_name = BINARY 'Kathiani Sub County Hospital' AND COALESCE(government_facility_code, '') <> '12230';

UPDATE facilities
SET facility_name = 'Kauma Health Centre', government_facility_code = '13658'
WHERE BINARY facility_name = BINARY 'Kauma Health Centre (Rachuonyo)' AND (BINARY facility_name <> BINARY 'Kauma Health Centre' OR COALESCE(government_facility_code, '') <> '13658');

UPDATE facilities
SET government_facility_code = '13658'
WHERE BINARY facility_name = BINARY 'Kauma Health Centre' AND COALESCE(government_facility_code, '') <> '13658';

UPDATE facilities
SET government_facility_code = '13667'
WHERE BINARY facility_name = BINARY 'Kendu Adventist Hospital' AND COALESCE(government_facility_code, '') <> '13667';

UPDATE facilities
SET government_facility_code = '13668'
WHERE BINARY facility_name = BINARY 'Kendu Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '13668';

UPDATE facilities
SET facility_name = 'Kiasa Dispensary', government_facility_code = '13686'
WHERE BINARY facility_name = BINARY 'Kiasa Health Center' AND (BINARY facility_name <> BINARY 'Kiasa Dispensary' OR COALESCE(government_facility_code, '') <> '13686');

UPDATE facilities
SET government_facility_code = '13686'
WHERE BINARY facility_name = BINARY 'Kiasa Dispensary' AND COALESCE(government_facility_code, '') <> '13686';

UPDATE facilities
SET government_facility_code = '12305'
WHERE BINARY facility_name = BINARY 'Kikesa Health Centre' AND COALESCE(government_facility_code, '') <> '12305';

UPDATE facilities
SET government_facility_code = '14868'
WHERE BINARY facility_name = BINARY 'Kimana Health Centre' AND COALESCE(government_facility_code, '') <> '14868';

UPDATE facilities
SET government_facility_code = '17911'
WHERE BINARY facility_name = BINARY 'Kisauni Health Centre' AND COALESCE(government_facility_code, '') <> '17911';

UPDATE facilities
SET facility_name = 'Kisegi Sub-County Hospital', government_facility_code = '13701'
WHERE BINARY facility_name = BINARY 'Kisegi Sub-District Hospital' AND (BINARY facility_name <> BINARY 'Kisegi Sub-County Hospital' OR COALESCE(government_facility_code, '') <> '13701');

UPDATE facilities
SET government_facility_code = '13701'
WHERE BINARY facility_name = BINARY 'Kisegi Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '13701';

UPDATE facilities
SET government_facility_code = '13705'
WHERE BINARY facility_name = BINARY 'Kitare Health Centre' AND COALESCE(government_facility_code, '') <> '13705';

UPDATE facilities
SET facility_name = 'GK Prison Dispensary (Athi River)', government_facility_code = '14517'
WHERE BINARY facility_name = BINARY 'Kitengela GK Prison Dispensary' AND (BINARY facility_name <> BINARY 'GK Prison Dispensary (Athi River)' OR COALESCE(government_facility_code, '') <> '14517');

UPDATE facilities
SET government_facility_code = '14517'
WHERE BINARY facility_name = BINARY 'GK Prison Dispensary (Athi River)' AND COALESCE(government_facility_code, '') <> '14517';

UPDATE facilities
SET government_facility_code = '14951'
WHERE BINARY facility_name = BINARY 'Kitengela Medical Services' AND COALESCE(government_facility_code, '') <> '14951';

UPDATE facilities
SET government_facility_code = '14950'
WHERE BINARY facility_name = BINARY 'Kitengela Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '14950';

UPDATE facilities
SET facility_name = 'Kithimani Health Centre', government_facility_code = '12357'
WHERE BINARY facility_name = BINARY 'Kithimani HC' AND (BINARY facility_name <> BINARY 'Kithimani Health Centre' OR COALESCE(government_facility_code, '') <> '12357');

UPDATE facilities
SET government_facility_code = '12357'
WHERE BINARY facility_name = BINARY 'Kithimani Health Centre' AND COALESCE(government_facility_code, '') <> '12357';

UPDATE facilities
SET government_facility_code = '12362'
WHERE BINARY facility_name = BINARY 'Kithyoko Health Centre' AND COALESCE(government_facility_code, '') <> '12362';

UPDATE facilities
SET government_facility_code = '12375'
WHERE BINARY facility_name = BINARY 'Kivaa Health Centre' AND COALESCE(government_facility_code, '') <> '12375';

UPDATE facilities
SET facility_name = 'Koduogo Dispensary', government_facility_code = '19861'
WHERE BINARY facility_name = BINARY 'Koduogo Health Centre' AND (BINARY facility_name <> BINARY 'Koduogo Dispensary' OR COALESCE(government_facility_code, '') <> '19861');

UPDATE facilities
SET government_facility_code = '19861'
WHERE BINARY facility_name = BINARY 'Koduogo Dispensary' AND COALESCE(government_facility_code, '') <> '19861';

UPDATE facilities
SET government_facility_code = '13712'
WHERE BINARY facility_name = BINARY 'Kokwanyo Health Centre' AND COALESCE(government_facility_code, '') <> '13712';

UPDATE facilities
SET government_facility_code = '11499'
WHERE BINARY facility_name = BINARY 'Kongowea Health Centre' AND COALESCE(government_facility_code, '') <> '11499';

UPDATE facilities
SET facility_name = 'Kyumbi CHS Dice', government_facility_code = '26816'
WHERE BINARY facility_name = BINARY 'Kyumbi DICE' AND (BINARY facility_name <> BINARY 'Kyumbi CHS Dice' OR COALESCE(government_facility_code, '') <> '26816');

UPDATE facilities
SET government_facility_code = '26816'
WHERE BINARY facility_name = BINARY 'Kyumbi CHS Dice' AND COALESCE(government_facility_code, '') <> '26816';

UPDATE facilities
SET facility_name = 'Lambwe Dispensary', government_facility_code = '13731'
WHERE BINARY facility_name = BINARY 'Lambwe Health Centre' AND (BINARY facility_name <> BINARY 'Lambwe Dispensary' OR COALESCE(government_facility_code, '') <> '13731');

UPDATE facilities
SET government_facility_code = '13731'
WHERE BINARY facility_name = BINARY 'Lambwe Dispensary' AND COALESCE(government_facility_code, '') <> '13731';

UPDATE facilities
SET government_facility_code = '15008'
WHERE BINARY facility_name = BINARY 'Lanet Health Centre' AND COALESCE(government_facility_code, '') <> '15008';

UPDATE facilities
SET facility_name = 'Langa Langa Hospital', government_facility_code = '15009'
WHERE BINARY facility_name = BINARY 'Langalanga Sub County Hospital' AND (BINARY facility_name <> BINARY 'Langa Langa Hospital' OR COALESCE(government_facility_code, '') <> '15009');

UPDATE facilities
SET government_facility_code = '15009'
WHERE BINARY facility_name = BINARY 'Langa Langa Hospital' AND COALESCE(government_facility_code, '') <> '15009';

UPDATE facilities
SET facility_name = 'Likoni Catholic Dispensary', government_facility_code = '11520'
WHERE BINARY facility_name = BINARY 'Likoni Catholic Hospital' AND (BINARY facility_name <> BINARY 'Likoni Catholic Dispensary' OR COALESCE(government_facility_code, '') <> '11520');

UPDATE facilities
SET government_facility_code = '11520'
WHERE BINARY facility_name = BINARY 'Likoni Catholic Dispensary' AND COALESCE(government_facility_code, '') <> '11520';

UPDATE facilities
SET facility_name = 'Likoni Sub-County Hospital', government_facility_code = '11522'
WHERE BINARY facility_name = BINARY 'Likoni District Hospital' AND (BINARY facility_name <> BINARY 'Likoni Sub-County Hospital' OR COALESCE(government_facility_code, '') <> '11522');

UPDATE facilities
SET government_facility_code = '11522'
WHERE BINARY facility_name = BINARY 'Likoni Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '11522';

UPDATE facilities
SET government_facility_code = '15051'
WHERE BINARY facility_name = BINARY 'Loitokitok Sub County Hospital' AND COALESCE(government_facility_code, '') <> '15051';

UPDATE facilities
SET government_facility_code = '15077'
WHERE BINARY facility_name = BINARY 'Longisa County Referral Hospital' AND COALESCE(government_facility_code, '') <> '15077';

UPDATE facilities
SET facility_name = 'Longisa County Referral Hospital', government_facility_code = '15077'
WHERE BINARY facility_name = BINARY 'Longisa County RH' AND (BINARY facility_name <> BINARY 'Longisa County Referral Hospital' OR COALESCE(government_facility_code, '') <> '15077');

UPDATE facilities
SET government_facility_code = '15077'
WHERE BINARY facility_name = BINARY 'Longisa County Referral Hospital' AND COALESCE(government_facility_code, '') <> '15077';

UPDATE facilities
SET government_facility_code = '12438'
WHERE BINARY facility_name = BINARY 'Machakos Level 5 Hospital' AND COALESCE(government_facility_code, '') <> '12438';

UPDATE facilities
SET government_facility_code = '13747'
WHERE BINARY facility_name = BINARY 'Madiany Sub County Hospital' AND COALESCE(government_facility_code, '') <> '13747';

UPDATE facilities
SET facility_name = 'Magadi Hospital', government_facility_code = '15107'
WHERE BINARY facility_name = BINARY 'Magadi hospital' AND (BINARY facility_name <> BINARY 'Magadi Hospital' OR COALESCE(government_facility_code, '') <> '15107');

UPDATE facilities
SET government_facility_code = '15107'
WHERE BINARY facility_name = BINARY 'Magadi Hospital' AND COALESCE(government_facility_code, '') <> '15107';

UPDATE facilities
SET government_facility_code = '15107'
WHERE BINARY facility_name = BINARY 'Magadi Hospital' AND COALESCE(government_facility_code, '') <> '15107';

UPDATE facilities
SET government_facility_code = '13751'
WHERE BINARY facility_name = BINARY 'Magina Health Centre' AND COALESCE(government_facility_code, '') <> '13751';

UPDATE facilities
SET government_facility_code = '11538'
WHERE BINARY facility_name = BINARY 'Magongo (MCM) Dispensary' AND COALESCE(government_facility_code, '') <> '11538';

UPDATE facilities
SET facility_name = 'Magunga Health Centre', government_facility_code = '13753'
WHERE BINARY facility_name = BINARY 'Magunga Level IV Hospital' AND (BINARY facility_name <> BINARY 'Magunga Health Centre' OR COALESCE(government_facility_code, '') <> '13753');

UPDATE facilities
SET government_facility_code = '13753'
WHERE BINARY facility_name = BINARY 'Magunga Health Centre' AND COALESCE(government_facility_code, '') <> '13753';

UPDATE facilities
SET government_facility_code = '15108'
WHERE BINARY facility_name = BINARY 'Mai Mahiu Health Centre' AND COALESCE(government_facility_code, '') <> '15108';

UPDATE facilities
SET facility_name = 'Makongeni Health Centre', government_facility_code = '19858'
WHERE BINARY facility_name = BINARY 'Makongeni Level 4' AND (BINARY facility_name <> BINARY 'Makongeni Health Centre' OR COALESCE(government_facility_code, '') <> '19858');

UPDATE facilities
SET government_facility_code = '19858'
WHERE BINARY facility_name = BINARY 'Makongeni Health Centre' AND COALESCE(government_facility_code, '') <> '19858';

UPDATE facilities
SET government_facility_code = '13760'
WHERE BINARY facility_name = BINARY 'Malanga Health Centre' AND COALESCE(government_facility_code, '') <> '13760';

UPDATE facilities
SET facility_name = 'Malela Dispensary', government_facility_code = '13761'
WHERE BINARY facility_name = BINARY 'Malela Level 4 Hospital' AND (BINARY facility_name <> BINARY 'Malela Dispensary' OR COALESCE(government_facility_code, '') <> '13761');

UPDATE facilities
SET government_facility_code = '13761'
WHERE BINARY facility_name = BINARY 'Malela Dispensary' AND COALESCE(government_facility_code, '') <> '13761';

UPDATE facilities
SET government_facility_code = '12466'
WHERE BINARY facility_name = BINARY 'Mananja Health Centre' AND COALESCE(government_facility_code, '') <> '12466';

UPDATE facilities
SET government_facility_code = '13771'
WHERE BINARY facility_name = BINARY 'Manyuanda Health Centre (Rarieda)' AND COALESCE(government_facility_code, '') <> '13771';

UPDATE facilities
SET facility_name = 'Maria Immaculata Health Centre', government_facility_code = '13062'
WHERE BINARY facility_name = BINARY 'Maria Immaculate Hospital Lavington' AND (BINARY facility_name <> BINARY 'Maria Immaculata Health Centre' OR COALESCE(government_facility_code, '') <> '13062');

UPDATE facilities
SET government_facility_code = '13062'
WHERE BINARY facility_name = BINARY 'Maria Immaculata Health Centre' AND COALESCE(government_facility_code, '') <> '13062';

UPDATE facilities
SET facility_name = 'Marindi Sub County Referral Hospital', government_facility_code = '13777'
WHERE BINARY facility_name = BINARY 'Marindi Sub County Hospital' AND (BINARY facility_name <> BINARY 'Marindi Sub County Referral Hospital' OR COALESCE(government_facility_code, '') <> '13777');

UPDATE facilities
SET government_facility_code = '13777'
WHERE BINARY facility_name = BINARY 'Marindi Sub County Referral Hospital' AND COALESCE(government_facility_code, '') <> '13777';

UPDATE facilities
SET government_facility_code = '15150'
WHERE BINARY facility_name = BINARY 'Mashuuru Sub County Hospital' AND COALESCE(government_facility_code, '') <> '15150';

UPDATE facilities
SET facility_name = 'Masii Health Centre', government_facility_code = '12475'
WHERE BINARY facility_name = BINARY 'Masii Level 4 Hospital' AND (BINARY facility_name <> BINARY 'Masii Health Centre' OR COALESCE(government_facility_code, '') <> '12475');

UPDATE facilities
SET government_facility_code = '12475'
WHERE BINARY facility_name = BINARY 'Masii Health Centre' AND COALESCE(government_facility_code, '') <> '12475';

UPDATE facilities
SET government_facility_code = '12476'
WHERE BINARY facility_name = BINARY 'Masinga Sub County Hospital' AND COALESCE(government_facility_code, '') <> '12476';

UPDATE facilities
SET government_facility_code = '13789'
WHERE BINARY facility_name = BINARY 'Matata Nursing Hospital' AND COALESCE(government_facility_code, '') <> '13789';

UPDATE facilities
SET government_facility_code = '12488'
WHERE BINARY facility_name = BINARY 'Matuu Level 4 Hospital' AND COALESCE(government_facility_code, '') <> '12488';

UPDATE facilities
SET facility_name = 'Matuu Level 4 Hospital', government_facility_code = '12488'
WHERE BINARY facility_name = BINARY 'Matuu SC Hospital' AND (BINARY facility_name <> BINARY 'Matuu Level 4 Hospital' OR COALESCE(government_facility_code, '') <> '12488');

UPDATE facilities
SET government_facility_code = '12488'
WHERE BINARY facility_name = BINARY 'Matuu Level 4 Hospital' AND COALESCE(government_facility_code, '') <> '12488';

UPDATE facilities
SET government_facility_code = '15156'
WHERE BINARY facility_name = BINARY 'Mau Narok Health Centre' AND COALESCE(government_facility_code, '') <> '15156';

UPDATE facilities
SET facility_name = 'Mavoko Sub-County Hospital', government_facility_code = '11936'
WHERE BINARY facility_name = BINARY 'Mavoko Level 4 Hospital' AND (BINARY facility_name <> BINARY 'Mavoko Sub-County Hospital' OR COALESCE(government_facility_code, '') <> '11936');

UPDATE facilities
SET government_facility_code = '11936'
WHERE BINARY facility_name = BINARY 'Mavoko Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '11936';

UPDATE facilities
SET government_facility_code = '12503'
WHERE BINARY facility_name = BINARY 'Mbiuni Health Centre' AND COALESCE(government_facility_code, '') <> '12503';

UPDATE facilities
SET government_facility_code = '18043'
WHERE BINARY facility_name = BINARY 'Mbungoni Catholic Dispensary (CBHC)' AND COALESCE(government_facility_code, '') <> '18043';

UPDATE facilities
SET facility_name = 'Young Generation Centre Dispensary (Med 25)', government_facility_code = '17690'
WHERE BINARY facility_name = BINARY 'Med 25 International Kenya' AND (BINARY facility_name <> BINARY 'Young Generation Centre Dispensary (Med 25)' OR COALESCE(government_facility_code, '') <> '17690');

UPDATE facilities
SET government_facility_code = '17690'
WHERE BINARY facility_name = BINARY 'Young Generation Centre Dispensary (Med 25)' AND COALESCE(government_facility_code, '') <> '17690';

UPDATE facilities
SET facility_name = 'Menengai health centre Nakuru', government_facility_code = '20138'
WHERE BINARY facility_name = BINARY 'Menengai Dispensary' AND (BINARY facility_name <> BINARY 'Menengai health centre Nakuru' OR COALESCE(government_facility_code, '') <> '20138');

UPDATE facilities
SET government_facility_code = '20138'
WHERE BINARY facility_name = BINARY 'Menengai health centre Nakuru' AND COALESCE(government_facility_code, '') <> '20138';

UPDATE facilities
SET government_facility_code = '11613'
WHERE BINARY facility_name = BINARY 'Mikindani (MCM) Dispensary' AND COALESCE(government_facility_code, '') <> '11613';

UPDATE facilities
SET government_facility_code = '11614'
WHERE BINARY facility_name = BINARY 'Mikindani Catholic Dispensary' AND COALESCE(government_facility_code, '') <> '11614';

UPDATE facilities
SET facility_name = 'Miniambo Dispensary', government_facility_code = '16766'
WHERE BINARY facility_name = BINARY 'Miniambo Health Centre' AND (BINARY facility_name <> BINARY 'Miniambo Dispensary' OR COALESCE(government_facility_code, '') <> '16766');

UPDATE facilities
SET government_facility_code = '16766'
WHERE BINARY facility_name = BINARY 'Miniambo Dispensary' AND COALESCE(government_facility_code, '') <> '16766';

UPDATE facilities
SET government_facility_code = '13812'
WHERE BINARY facility_name = BINARY 'Miriu Health Centre' AND COALESCE(government_facility_code, '') <> '13812';

UPDATE facilities
SET government_facility_code = '13813'
WHERE BINARY facility_name = BINARY 'Mirogi Health Centre' AND COALESCE(government_facility_code, '') <> '13813';

UPDATE facilities
SET facility_name = 'Mitaboni Health Centre', government_facility_code = '12530'
WHERE BINARY facility_name = BINARY 'Mitaboni HC' AND (BINARY facility_name <> BINARY 'Mitaboni Health Centre' OR COALESCE(government_facility_code, '') <> '12530');

UPDATE facilities
SET government_facility_code = '12530'
WHERE BINARY facility_name = BINARY 'Mitaboni Health Centre' AND COALESCE(government_facility_code, '') <> '12530';

UPDATE facilities
SET government_facility_code = '12530'
WHERE BINARY facility_name = BINARY 'Mitaboni Health Centre' AND COALESCE(government_facility_code, '') <> '12530';

UPDATE facilities
SET government_facility_code = '18210'
WHERE BINARY facility_name = BINARY 'Mlaleo Health Centre (MOH)' AND COALESCE(government_facility_code, '') <> '18210';

UPDATE facilities
SET facility_name = 'Mlolongo Health Centre', government_facility_code = '18581'
WHERE BINARY facility_name = BINARY 'Mlolongo Health Center' AND (BINARY facility_name <> BINARY 'Mlolongo Health Centre' OR COALESCE(government_facility_code, '') <> '18581');

UPDATE facilities
SET government_facility_code = '18581'
WHERE BINARY facility_name = BINARY 'Mlolongo Health Centre' AND COALESCE(government_facility_code, '') <> '18581';

UPDATE facilities
SET government_facility_code = '18581'
WHERE BINARY facility_name = BINARY 'Mlolongo Health Centre' AND COALESCE(government_facility_code, '') <> '18581';

UPDATE facilities
SET facility_name = 'Mogogosiek Health Centre', government_facility_code = '15195'
WHERE BINARY facility_name = BINARY 'Mogogosiek H/C' AND (BINARY facility_name <> BINARY 'Mogogosiek Health Centre' OR COALESCE(government_facility_code, '') <> '15195');

UPDATE facilities
SET government_facility_code = '15195'
WHERE BINARY facility_name = BINARY 'Mogogosiek Health Centre' AND COALESCE(government_facility_code, '') <> '15195';

UPDATE facilities
SET government_facility_code = '15212'
WHERE BINARY facility_name = BINARY 'Molo Sub County Hospital' AND COALESCE(government_facility_code, '') <> '15212';

UPDATE facilities
SET government_facility_code = '19606'
WHERE BINARY facility_name = BINARY 'Mrima Maternity Hospital' AND COALESCE(government_facility_code, '') <> '19606';

UPDATE facilities
SET government_facility_code = '18463'
WHERE BINARY facility_name = BINARY 'Mukuru Health Centre' AND COALESCE(government_facility_code, '') <> '18463';

UPDATE facilities
SET facility_name = 'Mutituni Health Centre', government_facility_code = '12602'
WHERE BINARY facility_name = BINARY 'Mutituni Level 4 Hospital' AND (BINARY facility_name <> BINARY 'Mutituni Health Centre' OR COALESCE(government_facility_code, '') <> '12602');

UPDATE facilities
SET government_facility_code = '12602'
WHERE BINARY facility_name = BINARY 'Mutituni Health Centre' AND COALESCE(government_facility_code, '') <> '12602';

UPDATE facilities
SET facility_name = 'Muumandu Health Centre (Machakos)', government_facility_code = '12612'
WHERE BINARY facility_name = BINARY 'Muumandu Health Center' AND (BINARY facility_name <> BINARY 'Muumandu Health Centre (Machakos)' OR COALESCE(government_facility_code, '') <> '12612');

UPDATE facilities
SET government_facility_code = '12612'
WHERE BINARY facility_name = BINARY 'Muumandu Health Centre (Machakos)' AND COALESCE(government_facility_code, '') <> '12612';

UPDATE facilities
SET government_facility_code = '12618'
WHERE BINARY facility_name = BINARY 'Mwala Subcounty Hospital' AND COALESCE(government_facility_code, '') <> '12618';

UPDATE facilities
SET government_facility_code = '15282'
WHERE BINARY facility_name = BINARY 'Naivasha (AIC) Kijabe Medical Centre' AND COALESCE(government_facility_code, '') <> '15282';

UPDATE facilities
SET facility_name = 'Naivasha Sub-County Hospital', government_facility_code = '15280'
WHERE BINARY facility_name = BINARY 'Naivasha District Hospital' AND (BINARY facility_name <> BINARY 'Naivasha Sub-County Hospital' OR COALESCE(government_facility_code, '') <> '15280');

UPDATE facilities
SET government_facility_code = '15280'
WHERE BINARY facility_name = BINARY 'Naivasha Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '15280';

UPDATE facilities
SET government_facility_code = '15288'
WHERE BINARY facility_name = BINARY 'Nakuru Provincial General Hospital' AND COALESCE(government_facility_code, '') <> '15288';

UPDATE facilities
SET facility_name = 'Nakuru West Health Centre', government_facility_code = '15365'
WHERE BINARY facility_name = BINARY 'Nakuru West (PCEA) Health Centre' AND (BINARY facility_name <> BINARY 'Nakuru West Health Centre' OR COALESCE(government_facility_code, '') <> '15365');

UPDATE facilities
SET government_facility_code = '15365'
WHERE BINARY facility_name = BINARY 'Nakuru West Health Centre' AND COALESCE(government_facility_code, '') <> '15365';

UPDATE facilities
SET government_facility_code = '15294'
WHERE BINARY facility_name = BINARY 'Namanga Health Centre' AND COALESCE(government_facility_code, '') <> '15294';

UPDATE facilities
SET government_facility_code = '13837'
WHERE BINARY facility_name = BINARY 'Naya Health Centre' AND COALESCE(government_facility_code, '') <> '13837';

UPDATE facilities
SET facility_name = 'Ndanai Sub County Hospital', government_facility_code = '15322'
WHERE BINARY facility_name = BINARY 'Ndanai SCH' AND (BINARY facility_name <> BINARY 'Ndanai Sub County Hospital' OR COALESCE(government_facility_code, '') <> '15322');

UPDATE facilities
SET government_facility_code = '15322'
WHERE BINARY facility_name = BINARY 'Ndanai Sub County Hospital' AND COALESCE(government_facility_code, '') <> '15322';

UPDATE facilities
SET government_facility_code = '15322'
WHERE BINARY facility_name = BINARY 'Ndanai Sub County Hospital' AND COALESCE(government_facility_code, '') <> '15322';

UPDATE facilities
SET facility_name = 'Ndhiwa DH', government_facility_code = '13841'
WHERE BINARY facility_name = BINARY 'Ndhiwa Sub County Hospital' AND (BINARY facility_name <> BINARY 'Ndhiwa DH' OR COALESCE(government_facility_code, '') <> '13841');

UPDATE facilities
SET government_facility_code = '13841'
WHERE BINARY facility_name = BINARY 'Ndhiwa DH' AND COALESCE(government_facility_code, '') <> '13841';

UPDATE facilities
SET facility_name = 'Ndhuru Dispensary', government_facility_code = '13842'
WHERE BINARY facility_name = BINARY 'Ndhuru health centre' AND (BINARY facility_name <> BINARY 'Ndhuru Dispensary' OR COALESCE(government_facility_code, '') <> '13842');

UPDATE facilities
SET government_facility_code = '13842'
WHERE BINARY facility_name = BINARY 'Ndhuru Dispensary' AND COALESCE(government_facility_code, '') <> '13842';

UPDATE facilities
SET facility_name = 'Ng''iya Health Centre', government_facility_code = '13852'
WHERE BINARY facility_name = BINARY 'Ng''Iya Health Centre' AND (BINARY facility_name <> BINARY 'Ng''iya Health Centre' OR COALESCE(government_facility_code, '') <> '13852');

UPDATE facilities
SET government_facility_code = '13852'
WHERE BINARY facility_name = BINARY 'Ng''iya Health Centre' AND COALESCE(government_facility_code, '') <> '13852';

UPDATE facilities
SET facility_name = 'Ngegu Dispensary', government_facility_code = '13849'
WHERE BINARY facility_name = BINARY 'Ngegu Health Centre' AND (BINARY facility_name <> BINARY 'Ngegu Dispensary' OR COALESCE(government_facility_code, '') <> '13849');

UPDATE facilities
SET government_facility_code = '13849'
WHERE BINARY facility_name = BINARY 'Ngegu Dispensary' AND COALESCE(government_facility_code, '') <> '13849';

UPDATE facilities
SET government_facility_code = '15351'
WHERE BINARY facility_name = BINARY 'Ngong Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '15351';

UPDATE facilities
SET government_facility_code = '12657'
WHERE BINARY facility_name = BINARY 'Nguluni Health Centre' AND COALESCE(government_facility_code, '') <> '12657';

UPDATE facilities
SET government_facility_code = '15358'
WHERE BINARY facility_name = BINARY 'Njoro Subcounty Hospital' AND COALESCE(government_facility_code, '') <> '15358';

UPDATE facilities
SET facility_name = 'Nyagoro Health Center', government_facility_code = '13875'
WHERE BINARY facility_name = BINARY 'Nyagoro Health Centre' AND (BINARY facility_name <> BINARY 'Nyagoro Health Center' OR COALESCE(government_facility_code, '') <> '13875');

UPDATE facilities
SET government_facility_code = '13875'
WHERE BINARY facility_name = BINARY 'Nyagoro Health Center' AND COALESCE(government_facility_code, '') <> '13875';

UPDATE facilities
SET facility_name = 'Nyalkinyi (Jersey) Dispensary', government_facility_code = '16986'
WHERE BINARY facility_name = BINARY 'Nyalkinyi Health Centre' AND (BINARY facility_name <> BINARY 'Nyalkinyi (Jersey) Dispensary' OR COALESCE(government_facility_code, '') <> '16986');

UPDATE facilities
SET government_facility_code = '16986'
WHERE BINARY facility_name = BINARY 'Nyalkinyi (Jersey) Dispensary' AND COALESCE(government_facility_code, '') <> '16986';

UPDATE facilities
SET facility_name = 'Nyandiwa Dispensary', government_facility_code = '13920'
WHERE BINARY facility_name = BINARY 'Nyandiwa Level IV Hospital' AND (BINARY facility_name <> BINARY 'Nyandiwa Dispensary' OR COALESCE(government_facility_code, '') <> '13920');

UPDATE facilities
SET government_facility_code = '13920'
WHERE BINARY facility_name = BINARY 'Nyandiwa Dispensary' AND COALESCE(government_facility_code, '') <> '13920';

UPDATE facilities
SET government_facility_code = '13929'
WHERE BINARY facility_name = BINARY 'Nyang''oma Mission Health Centre' AND COALESCE(government_facility_code, '') <> '13929';

UPDATE facilities
SET government_facility_code = '13926'
WHERE BINARY facility_name = BINARY 'Nyangiela Sub County Hospital' AND COALESCE(government_facility_code, '') <> '13926';

UPDATE facilities
SET facility_name = 'Obalwanda Dispensary', government_facility_code = '13950'
WHERE BINARY facility_name = BINARY 'Obalwanda Health Centre' AND (BINARY facility_name <> BINARY 'Obalwanda Dispensary' OR COALESCE(government_facility_code, '') <> '13950');

UPDATE facilities
SET government_facility_code = '13950'
WHERE BINARY facility_name = BINARY 'Obalwanda Dispensary' AND COALESCE(government_facility_code, '') <> '13950';

UPDATE facilities
SET facility_name = 'Ober Health Center', government_facility_code = '13953'
WHERE BINARY facility_name = BINARY 'Ober Level 4Hospital' AND (BINARY facility_name <> BINARY 'Ober Health Center' OR COALESCE(government_facility_code, '') <> '13953');

UPDATE facilities
SET government_facility_code = '13953'
WHERE BINARY facility_name = BINARY 'Ober Health Center' AND COALESCE(government_facility_code, '') <> '13953';

UPDATE facilities
SET facility_name = 'Obunga Dispensary', government_facility_code = '13957'
WHERE BINARY facility_name = BINARY 'Obunga Health Centre' AND (BINARY facility_name <> BINARY 'Obunga Dispensary' OR COALESCE(government_facility_code, '') <> '13957');

UPDATE facilities
SET government_facility_code = '13957'
WHERE BINARY facility_name = BINARY 'Obunga Dispensary' AND COALESCE(government_facility_code, '') <> '13957';

UPDATE facilities
SET facility_name = 'Obwanda Dispensary', government_facility_code = '13958'
WHERE BINARY facility_name = BINARY 'Obwanda Health Centre' AND (BINARY facility_name <> BINARY 'Obwanda Dispensary' OR COALESCE(government_facility_code, '') <> '13958');

UPDATE facilities
SET government_facility_code = '13958'
WHERE BINARY facility_name = BINARY 'Obwanda Dispensary' AND COALESCE(government_facility_code, '') <> '13958';

UPDATE facilities
SET facility_name = 'Ogongo Sub County Hospital', government_facility_code = '13967'
WHERE BINARY facility_name = BINARY 'Ogongo Level 4 Hospital' AND (BINARY facility_name <> BINARY 'Ogongo Sub County Hospital' OR COALESCE(government_facility_code, '') <> '13967');

UPDATE facilities
SET government_facility_code = '13967'
WHERE BINARY facility_name = BINARY 'Ogongo Sub County Hospital' AND COALESCE(government_facility_code, '') <> '13967';

UPDATE facilities
SET government_facility_code = '13972'
WHERE BINARY facility_name = BINARY 'Okiki Amayo Health Centre' AND COALESCE(government_facility_code, '') <> '13972';

UPDATE facilities
SET facility_name = 'Okok Dispensary', government_facility_code = '16259'
WHERE BINARY facility_name = BINARY 'Okok Health Center' AND (BINARY facility_name <> BINARY 'Okok Dispensary' OR COALESCE(government_facility_code, '') <> '16259');

UPDATE facilities
SET government_facility_code = '16259'
WHERE BINARY facility_name = BINARY 'Okok Dispensary' AND COALESCE(government_facility_code, '') <> '16259';

UPDATE facilities
SET government_facility_code = '15398'
WHERE BINARY facility_name = BINARY 'Olenguruone Sub County Hospital' AND COALESCE(government_facility_code, '') <> '15398';

UPDATE facilities
SET government_facility_code = '13987'
WHERE BINARY facility_name = BINARY 'Ong''ielo Health Centre' AND COALESCE(government_facility_code, '') <> '13987';

UPDATE facilities
SET government_facility_code = '15440'
WHERE BINARY facility_name = BINARY 'Ongata Rongai Sub County Hospital' AND COALESCE(government_facility_code, '') <> '15440';

UPDATE facilities
SET government_facility_code = '14002'
WHERE BINARY facility_name = BINARY 'Othoro Level 4 Hospital (Rachuonyo)' AND COALESCE(government_facility_code, '') <> '14002';

UPDATE facilities
SET facility_name = 'OUR LADY F LOURDES RANGALA MISSION HOPSPITAL', government_facility_code = '14033'
WHERE BINARY facility_name = BINARY 'Our Lady of Lourdes Rangala Mission Hospital' AND (BINARY facility_name <> BINARY 'OUR LADY F LOURDES RANGALA MISSION HOPSPITAL' OR COALESCE(government_facility_code, '') <> '14033');

UPDATE facilities
SET government_facility_code = '14033'
WHERE BINARY facility_name = BINARY 'OUR LADY F LOURDES RANGALA MISSION HOPSPITAL' AND COALESCE(government_facility_code, '') <> '14033';

UPDATE facilities
SET facility_name = 'Pala Level4', government_facility_code = '14011'
WHERE BINARY facility_name = BINARY 'Pala Level 4 Hospital' AND (BINARY facility_name <> BINARY 'Pala Level4' OR COALESCE(government_facility_code, '') <> '14011');

UPDATE facilities
SET government_facility_code = '14011'
WHERE BINARY facility_name = BINARY 'Pala Level4' AND COALESCE(government_facility_code, '') <> '14011';

UPDATE facilities
SET government_facility_code = '11740'
WHERE BINARY facility_name = BINARY 'Port Reitz Sub County Hospital' AND COALESCE(government_facility_code, '') <> '11740';

UPDATE facilities
SET facility_name = 'Kabondo Sub County Hospital', government_facility_code = '13638'
WHERE BINARY facility_name = BINARY 'Rachuonyo East Sub County Hospital' AND (BINARY facility_name <> BINARY 'Kabondo Sub County Hospital' OR COALESCE(government_facility_code, '') <> '13638');

UPDATE facilities
SET government_facility_code = '13638'
WHERE BINARY facility_name = BINARY 'Kabondo Sub County Hospital' AND COALESCE(government_facility_code, '') <> '13638';

UPDATE facilities
SET government_facility_code = '14022'
WHERE BINARY facility_name = BINARY 'Rachuonyo sub-county Hospital' AND COALESCE(government_facility_code, '') <> '14022';

UPDATE facilities
SET government_facility_code = '14036'
WHERE BINARY facility_name = BINARY 'Rangwe Sub County Hospital' AND COALESCE(government_facility_code, '') <> '14036';

UPDATE facilities
SET government_facility_code = '14038'
WHERE BINARY facility_name = BINARY 'Rariw Health Centre' AND COALESCE(government_facility_code, '') <> '14038';

UPDATE facilities
SET government_facility_code = '14039'
WHERE BINARY facility_name = BINARY 'Raruowa Health Centre' AND COALESCE(government_facility_code, '') <> '14039';

UPDATE facilities
SET facility_name = 'Rocco Dispensary', government_facility_code = '15489'
WHERE BINARY facility_name = BINARY 'Rocco dispensary' AND (BINARY facility_name <> BINARY 'Rocco Dispensary' OR COALESCE(government_facility_code, '') <> '15489');

UPDATE facilities
SET government_facility_code = '15489'
WHERE BINARY facility_name = BINARY 'Rocco Dispensary' AND COALESCE(government_facility_code, '') <> '15489';

UPDATE facilities
SET government_facility_code = '15489'
WHERE BINARY facility_name = BINARY 'Rocco Dispensary' AND COALESCE(government_facility_code, '') <> '15489';

UPDATE facilities
SET government_facility_code = '17594'
WHERE BINARY facility_name = BINARY 'Rusinga Island of Hope Humanist Health Centre' AND COALESCE(government_facility_code, '') <> '17594';

UPDATE facilities
SET government_facility_code = '14073'
WHERE BINARY facility_name = BINARY 'Sega Mission Hospital' AND COALESCE(government_facility_code, '') <> '14073';

UPDATE facilities
SET facility_name = 'Sena Health Centre', government_facility_code = '14075'
WHERE BINARY facility_name = BINARY 'Sena Level 4 Hospital' AND (BINARY facility_name <> BINARY 'Sena Health Centre' OR COALESCE(government_facility_code, '') <> '14075');

UPDATE facilities
SET government_facility_code = '14075'
WHERE BINARY facility_name = BINARY 'Sena Health Centre' AND COALESCE(government_facility_code, '') <> '14075';

UPDATE facilities
SET facility_name = 'Shalom Community Hospital (Machakos)', government_facility_code = '12730'
WHERE BINARY facility_name = BINARY 'Shalom Community Hospital' AND (BINARY facility_name <> BINARY 'Shalom Community Hospital (Machakos)' OR COALESCE(government_facility_code, '') <> '12730');

UPDATE facilities
SET government_facility_code = '12730'
WHERE BINARY facility_name = BINARY 'Shalom Community Hospital (Machakos)' AND COALESCE(government_facility_code, '') <> '12730';

UPDATE facilities
SET government_facility_code = '11395'
WHERE BINARY facility_name = BINARY 'Shimo-La Tewa Health Centre (GK Prison)' AND COALESCE(government_facility_code, '') <> '11395';

UPDATE facilities
SET government_facility_code = '14078'
WHERE BINARY facility_name = BINARY 'Shirikisho Health Centre' AND COALESCE(government_facility_code, '') <> '14078';

UPDATE facilities
SET government_facility_code = '14080'
WHERE BINARY facility_name = BINARY 'Siaya County Referral Hospital' AND COALESCE(government_facility_code, '') <> '14080';

UPDATE facilities
SET facility_name = 'Sigomere Subcounty Hospital', government_facility_code = '14085'
WHERE BINARY facility_name = BINARY 'Sigomere Sub County Hospital' AND (BINARY facility_name <> BINARY 'Sigomere Subcounty Hospital' OR COALESCE(government_facility_code, '') <> '14085');

UPDATE facilities
SET government_facility_code = '14085'
WHERE BINARY facility_name = BINARY 'Sigomere Subcounty Hospital' AND COALESCE(government_facility_code, '') <> '14085';

UPDATE facilities
SET government_facility_code = '14085'
WHERE BINARY facility_name = BINARY 'Sigomere Subcounty Hospital' AND COALESCE(government_facility_code, '') <> '14085';

UPDATE facilities
SET government_facility_code = '15565'
WHERE BINARY facility_name = BINARY 'Sigor Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '15565';

UPDATE facilities
SET facility_name = 'Sigor Sub-County Hospital', government_facility_code = '15565'
WHERE BINARY facility_name = BINARY 'Sigor Sub-District Hospital' AND (BINARY facility_name <> BINARY 'Sigor Sub-County Hospital' OR COALESCE(government_facility_code, '') <> '15565');

UPDATE facilities
SET government_facility_code = '15565'
WHERE BINARY facility_name = BINARY 'Sigor Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '15565';

UPDATE facilities
SET facility_name = 'Silibwet Dispensary (Bomet)', government_facility_code = '15570'
WHERE BINARY facility_name = BINARY 'Silibwet Dispensary Bomet' AND (BINARY facility_name <> BINARY 'Silibwet Dispensary (Bomet)' OR COALESCE(government_facility_code, '') <> '15570');

UPDATE facilities
SET government_facility_code = '15570'
WHERE BINARY facility_name = BINARY 'Silibwet Dispensary (Bomet)' AND COALESCE(government_facility_code, '') <> '15570';

UPDATE facilities
SET facility_name = 'Siongiroi Health Centre', government_facility_code = '15587'
WHERE BINARY facility_name = BINARY 'Siongiroi H/C' AND (BINARY facility_name <> BINARY 'Siongiroi Health Centre' OR COALESCE(government_facility_code, '') <> '15587');

UPDATE facilities
SET government_facility_code = '15587'
WHERE BINARY facility_name = BINARY 'Siongiroi Health Centre' AND COALESCE(government_facility_code, '') <> '15587';

UPDATE facilities
SET government_facility_code = '15619'
WHERE BINARY facility_name = BINARY 'Sotik Health Centre' AND COALESCE(government_facility_code, '') <> '15619';

UPDATE facilities
SET government_facility_code = '13193'
WHERE BINARY facility_name = BINARY 'Special Treatment Clinic' AND COALESCE(government_facility_code, '') <> '13193';

UPDATE facilities
SET government_facility_code = '13739'
WHERE BINARY facility_name = BINARY 'St Elizabeth Lwak Mission Health Centre' AND COALESCE(government_facility_code, '') <> '13739';

UPDATE facilities
SET government_facility_code = '15652'
WHERE BINARY facility_name = BINARY 'St Mary Health Centre (Kiserian)' AND COALESCE(government_facility_code, '') <> '15652';

UPDATE facilities
SET facility_name = 'St Theresa Dispensary', government_facility_code = '15667'
WHERE BINARY facility_name = BINARY 'St Therese Dispensary' AND (BINARY facility_name <> BINARY 'St Theresa Dispensary' OR COALESCE(government_facility_code, '') <> '15667');

UPDATE facilities
SET government_facility_code = '15667'
WHERE BINARY facility_name = BINARY 'St Theresa Dispensary' AND COALESCE(government_facility_code, '') <> '15667';

UPDATE facilities
SET government_facility_code = '20364'
WHERE BINARY facility_name = BINARY 'St.Mary''s Ringa Health Centre' AND COALESCE(government_facility_code, '') <> '20364';

UPDATE facilities
SET facility_name = 'Mbita Sub-County Hospital', government_facility_code = '13798'
WHERE BINARY facility_name = BINARY 'Suba North Sub-County Hospital' AND (BINARY facility_name <> BINARY 'Mbita Sub-County Hospital' OR COALESCE(government_facility_code, '') <> '13798');

UPDATE facilities
SET government_facility_code = '13798'
WHERE BINARY facility_name = BINARY 'Mbita Sub-County Hospital' AND COALESCE(government_facility_code, '') <> '13798';

UPDATE facilities
SET government_facility_code = '14130'
WHERE BINARY facility_name = BINARY 'Suba Sub County Hospital' AND COALESCE(government_facility_code, '') <> '14130';

UPDATE facilities
SET government_facility_code = '15678'
WHERE BINARY facility_name = BINARY 'Subukia Sub County Hospital' AND COALESCE(government_facility_code, '') <> '15678';

UPDATE facilities
SET government_facility_code = '15719'
WHERE BINARY facility_name = BINARY 'Tenwek Mission Hospital' AND COALESCE(government_facility_code, '') <> '15719';

UPDATE facilities
SET government_facility_code = '14150'
WHERE BINARY facility_name = BINARY 'Tom Mboya Memorial Level 4 Hospital' AND COALESCE(government_facility_code, '') <> '14150';

UPDATE facilities
SET facility_name = 'Tom Mboya Memorial Level 4 Hospital', government_facility_code = '14150'
WHERE BINARY facility_name = BINARY 'Tom Mboya Memorial SCH' AND (BINARY facility_name <> BINARY 'Tom Mboya Memorial Level 4 Hospital' OR COALESCE(government_facility_code, '') <> '14150');

UPDATE facilities
SET government_facility_code = '14150'
WHERE BINARY facility_name = BINARY 'Tom Mboya Memorial Level 4 Hospital' AND COALESCE(government_facility_code, '') <> '14150';

UPDATE facilities
SET facility_name = 'Tudor Sub-County Hospital (Mombasa)', government_facility_code = '11861'
WHERE BINARY facility_name = BINARY 'Tudor District Hospital (Mombasa)' AND (BINARY facility_name <> BINARY 'Tudor Sub-County Hospital (Mombasa)' OR COALESCE(government_facility_code, '') <> '11861');

UPDATE facilities
SET government_facility_code = '11861'
WHERE BINARY facility_name = BINARY 'Tudor Sub-County Hospital (Mombasa)' AND COALESCE(government_facility_code, '') <> '11861';

UPDATE facilities
SET government_facility_code = '14156'
WHERE BINARY facility_name = BINARY 'Ukwala Sub County Hospital' AND COALESCE(government_facility_code, '') <> '14156';

UPDATE facilities
SET government_facility_code = '14162'
WHERE BINARY facility_name = BINARY 'Usao Health Centre' AND COALESCE(government_facility_code, '') <> '14162';

UPDATE facilities
SET facility_name = 'Usigu Sub County Hospital', government_facility_code = '14164'
WHERE BINARY facility_name = BINARY 'Usigu Health Centre' AND (BINARY facility_name <> BINARY 'Usigu Sub County Hospital' OR COALESCE(government_facility_code, '') <> '14164');

UPDATE facilities
SET government_facility_code = '14164'
WHERE BINARY facility_name = BINARY 'Usigu Sub County Hospital' AND COALESCE(government_facility_code, '') <> '14164';

UPDATE facilities
SET government_facility_code = '14164'
WHERE BINARY facility_name = BINARY 'Usigu Sub County Hospital' AND COALESCE(government_facility_code, '') <> '14164';

UPDATE facilities
SET facility_name = 'Wagwe Health Center', government_facility_code = '14168'
WHERE BINARY facility_name = BINARY 'Wagwe Health Centre' AND (BINARY facility_name <> BINARY 'Wagwe Health Center' OR COALESCE(government_facility_code, '') <> '14168');

UPDATE facilities
SET government_facility_code = '14168'
WHERE BINARY facility_name = BINARY 'Wagwe Health Center' AND COALESCE(government_facility_code, '') <> '14168';

UPDATE facilities
SET government_facility_code = '14169'
WHERE BINARY facility_name = BINARY 'Wakula Health Centre' AND COALESCE(government_facility_code, '') <> '14169';

UPDATE facilities
SET government_facility_code = '12841'
WHERE BINARY facility_name = BINARY 'Wamunyu Health Centre' AND COALESCE(government_facility_code, '') <> '12841';

UPDATE facilities
SET facility_name = 'Waware Dispensary', government_facility_code = '14171'
WHERE BINARY facility_name = BINARY 'Waware Health Centre' AND (BINARY facility_name <> BINARY 'Waware Dispensary' OR COALESCE(government_facility_code, '') <> '14171');

UPDATE facilities
SET government_facility_code = '14171'
WHERE BINARY facility_name = BINARY 'Waware Dispensary' AND COALESCE(government_facility_code, '') <> '14171';

UPDATE facilities
SET government_facility_code = '14175'
WHERE BINARY facility_name = BINARY 'Yala Sub County Hospital' AND COALESCE(government_facility_code, '') <> '14175';

UPDATE facilities
SET government_facility_code = '17690'
WHERE BINARY facility_name = BINARY 'Young Generation Centre Dispensary (Med 25)' AND COALESCE(government_facility_code, '') <> '17690';

COMMIT;
