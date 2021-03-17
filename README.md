# PowerCampus-AcademicKey
 Unique key add-on for PowerCampus's ACADEMIC table. MCNY has been using this customization in production for more than two years.

# Why?
The `ACADEMIC` table has only a composit primary key, and many of the constituent columns change. A lot. This makes integrating with other systems terribly difficult.

Imagine a student applies and is accepted for An Associates of Arts in Program A via a third-party CRM. Your snazzy bi-directional integration pushes this into PowerCampus. The student then decides to register for a Bachelor of Arts in Program A, and the powers that be allow this. The registrar changes the `PROGRAM` column in PowerCampus. Now the primary key has changed and your integration is broken. :-(

# What?
Effectively, this method will give you a primary uniqueidentifier (GUID or UUID) on session rows in `ACADEMIC`. (Rollup records are excluded.)

Using the included `custom.vwACADEMIC`, you can select, update, and delete against the ACADEMIC table using the unique key.

# How?
Instead of modifying `dbo.ACADEMIC` directly, another table, `custom.AcademicKey`, is added with an automatic, unique key named `id` plus all the columns from `ACADEMIC.ACADEMIC_PK`. The latter columns are a cascading foreign key referencing `dbo.ACADEMIC`.

A trigger is also added to `dbo.ACADEMIC` to insert new rows into `AcademicKey`. This is the only modification made outside the `custom` schema.

## Why `custom` schema?
Instead of struggling to keep track of what code was created by your institution vs Ellucian and/or using messy prefixes in object names,  just create a new schema for your custom objects. This keeps some separation between stock and custom code, and it's easy to enumerate exactly what's in your `custom` schema.

I specifically recommend the `custom` name for all institutions (vs your institution's initials) because it allows code portability between institutions.

# Disclaimer
No warranties. Use all custom code at your own risk!

PowerCampus™ is a trademark of Ellucian Company L.P. or its affiliates and is registered in the U.S. and other countries. Ellucian is in no way affiliated with this project or the author.
