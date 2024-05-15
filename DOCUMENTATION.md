

**Strong snd Weak Entities**

**Strong Entity** : An entity that has its own unique identifier like (Primary Key) and 
does not depend on any other entity is called Strong Entity. PRODUCT will be strong entity.

**Weak Entity** : An entity that does not have its own unique identifier and depend on 
the existence of a related strong entity for its identification. INVENTORY, TRANSACTION,REVIEW will be weak entity.

**Supertype and Strongtype**

**Supertype**: Supertype will be USER because the account entity is expanded from USER entity.

**Subtype**: It inherit properties from supertype entity
and may have additional attributes specific to their subtype. So ACCOUNT will be subtype since it can't exist 
without USER