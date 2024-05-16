**Strong and Weak Entities**

**Strong Entity** : An entity that has its own unique identifier like (Primary Key) and
does not depend on any other entity is called Strong Entity. PRODUCT will be a strong entity.

**Weak Entity** : An entity that does not have its own unique identifier and depends on
the existence of a related strong entity for its identification. INVENTORY, TRANSACTION, REVIEW will be a weak entity.

**Supertype and Strongtype**

**Supertype**: The supertype will be USER because the account entity is expanded from USER entity.

**Subtype**: It inherits properties from the supertype entity
and may have additional attributes specific to their subtype. So ACCOUNT will be a subtype since it can't exist
without USER.














