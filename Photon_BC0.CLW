  MEMBER('Photon.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Photon_BC0:DctInit    PROCEDURE()
Photon_BC0:DctKill    PROCEDURE()
Photon_BC0:FilesInit  PROCEDURE()
  END

Hide:Access:Neurons  CLASS(FileManager),TYPE               ! FileManager for Neurons
BindFields             PROCEDURE(),DERIVED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Neurons  CLASS(RelationManager),TYPE           ! RelationManager for Neurons
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Files    CLASS(FileManager),TYPE               ! FileManager for Files
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Files    CLASS(RelationManager),TYPE           ! RelationManager for Files
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:License  CLASS(FileManager),TYPE               ! FileManager for License
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:License  CLASS(RelationManager),TYPE           ! RelationManager for License
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Geometries CLASS(FileManager),TYPE             ! FileManager for Geometries
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Geometries CLASS(RelationManager),TYPE         ! RelationManager for Geometries
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Themes   CLASS(FileManager),TYPE               ! FileManager for Themes
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Themes   CLASS(RelationManager),TYPE           ! RelationManager for Themes
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Thoughts CLASS(FileManager),TYPE               ! FileManager for Thoughts
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Thoughts CLASS(RelationManager),TYPE           ! RelationManager for Thoughts
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Lists    CLASS(FileManager),TYPE               ! FileManager for Lists
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Lists    CLASS(RelationManager),TYPE           ! RelationManager for Lists
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:A_Neurons CLASS(FileManager),TYPE              ! FileManager for A_Neurons
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:A_Neurons CLASS(RelationManager),TYPE          ! RelationManager for A_Neurons
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:Neurons &Hide:Access:Neurons,AUTO,THREAD
_Hide:Relate:Neurons &Hide:Relate:Neurons,AUTO,THREAD
_Hide:Access:Files   &Hide:Access:Files,AUTO,THREAD
_Hide:Relate:Files   &Hide:Relate:Files,AUTO,THREAD
_Hide:Access:License &Hide:Access:License,AUTO,THREAD
_Hide:Relate:License &Hide:Relate:License,AUTO,THREAD
_Hide:Access:Geometries &Hide:Access:Geometries,AUTO,THREAD
_Hide:Relate:Geometries &Hide:Relate:Geometries,AUTO,THREAD
_Hide:Access:Themes  &Hide:Access:Themes,AUTO,THREAD
_Hide:Relate:Themes  &Hide:Relate:Themes,AUTO,THREAD
_Hide:Access:Thoughts &Hide:Access:Thoughts,AUTO,THREAD
_Hide:Relate:Thoughts &Hide:Relate:Thoughts,AUTO,THREAD
_Hide:Access:Lists   &Hide:Access:Lists,AUTO,THREAD
_Hide:Relate:Lists   &Hide:Relate:Lists,AUTO,THREAD
_Hide:Access:A_Neurons &Hide:Access:A_Neurons,AUTO,THREAD
_Hide:Relate:A_Neurons &Hide:Relate:A_Neurons,AUTO,THREAD


Photon_BC0:DctInit PROCEDURE()
  CODE
  _Hide:Access:Neurons &= NEW(Hide:Access:Neurons)
  _Hide:Relate:Neurons &= NEW(Hide:Relate:Neurons)
  _Hide:Access:Files &= NEW(Hide:Access:Files)
  _Hide:Relate:Files &= NEW(Hide:Relate:Files)
  _Hide:Access:License &= NEW(Hide:Access:License)
  _Hide:Relate:License &= NEW(Hide:Relate:License)
  _Hide:Access:Geometries &= NEW(Hide:Access:Geometries)
  _Hide:Relate:Geometries &= NEW(Hide:Relate:Geometries)
  _Hide:Access:Themes &= NEW(Hide:Access:Themes)
  _Hide:Relate:Themes &= NEW(Hide:Relate:Themes)
  _Hide:Access:Thoughts &= NEW(Hide:Access:Thoughts)
  _Hide:Relate:Thoughts &= NEW(Hide:Relate:Thoughts)
  _Hide:Access:Lists &= NEW(Hide:Access:Lists)
  _Hide:Relate:Lists &= NEW(Hide:Relate:Lists)
  _Hide:Access:A_Neurons &= NEW(Hide:Access:A_Neurons)
  _Hide:Relate:A_Neurons &= NEW(Hide:Relate:A_Neurons)
  Relate:Neurons &= _Hide:Relate:Neurons
  Relate:Files &= _Hide:Relate:Files
  Relate:License &= _Hide:Relate:License
  Relate:Geometries &= _Hide:Relate:Geometries
  Relate:Themes &= _Hide:Relate:Themes
  Relate:Thoughts &= _Hide:Relate:Thoughts
  Relate:Lists &= _Hide:Relate:Lists
  Relate:A_Neurons &= _Hide:Relate:A_Neurons


Photon_BC0:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:Neurons.Init
  _Hide:Relate:Files.Init
  _Hide:Relate:License.Init
  _Hide:Relate:Geometries.Init
  _Hide:Relate:Themes.Init
  _Hide:Relate:Thoughts.Init
  _Hide:Relate:Lists.Init
  _Hide:Relate:A_Neurons.Init


Photon_BC0:DctKill PROCEDURE()
  CODE
  _Hide:Relate:Neurons.Kill
  DISPOSE(_Hide:Relate:Neurons)
  _Hide:Relate:Files.Kill
  DISPOSE(_Hide:Relate:Files)
  _Hide:Relate:License.Kill
  DISPOSE(_Hide:Relate:License)
  _Hide:Relate:Geometries.Kill
  DISPOSE(_Hide:Relate:Geometries)
  _Hide:Relate:Themes.Kill
  DISPOSE(_Hide:Relate:Themes)
  _Hide:Relate:Thoughts.Kill
  DISPOSE(_Hide:Relate:Thoughts)
  _Hide:Relate:Lists.Kill
  DISPOSE(_Hide:Relate:Lists)
  _Hide:Relate:A_Neurons.Kill
  DISPOSE(_Hide:Relate:A_Neurons)


Hide:Relate:Neurons.Init PROCEDURE()
  CODE
  _Hide:Access:Neurons.Init
  SELF.Init(Access:Neurons,1)


Hide:Access:Neurons.BindFields PROCEDURE

  CODE
  PARENT.BindFields
  BIND('NEU:Extended_Data',NEU:Extended_Data)              ! Bind memo field


Hide:Access:Neurons.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NEU:Record
  SELF.FileNameValue = 'Neurons'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Neurons
  PARENT.Init
  Access:Neurons &= SELF


Hide:Access:Neurons.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Neurons &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Neurons.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Neurons,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(NEU:Tought_ID_Key,'NEU:Tought_ID_Key',0)
    SELF.AddKey(NEU:Neuron_ID_Key,'NEU:Neuron_ID_Key',1)
    SELF.AddKey(NEU:Neuron_Parent_ID_Key,'NEU:Neuron_Parent_ID_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Neurons.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Files,RI:CASCADE,RI:CASCADE,FIL:Data_ID_Key)
  SELF.AddRelationLink(NEU:Neuron_ID,FIL:ID)

  SELF.AddRelation(Relate:Thoughts)

  SELF.AddRelation(Relate:Lists,RI:CASCADE,RI:CASCADE,LIS:Neuron_ID_Key)
  SELF.AddRelationLink(NEU:Neuron_ID,LIS:Neuron_ID)


Hide:Relate:Neurons.Kill PROCEDURE

  CODE
  _Hide:Access:Neurons.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Neurons &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Neurons)                            ! destroy the file manager


Hide:Relate:Files.Init PROCEDURE()
  CODE
  _Hide:Access:Files.Init
  SELF.Init(Access:Files,1)


Hide:Access:Files.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FIL:Record
  SELF.FileNameValue = 'Files'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Files
  PARENT.Init
  Access:Files &= SELF


Hide:Access:Files.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Files &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Files.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Files,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(FIL:Files_ID_Key,'FIL:Files_ID_Key',1)
    SELF.AddKey(FIL:Data_ID_Key,'FIL:Data_ID_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Files.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Neurons)


Hide:Relate:Files.Kill PROCEDURE

  CODE
  _Hide:Access:Files.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:Files &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Files)                              ! destroy the file manager


Hide:Relate:License.Init PROCEDURE()
  CODE
  _Hide:Access:License.Init
  SELF.Init(Access:License,1)


Hide:Access:License.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIC:Record
  SELF.FileNameValue = 'License'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= License
  PARENT.Init
  Access:License &= SELF


Hide:Access:License.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:License &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:License.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(License,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LIC:Release_Key,'LIC:Release_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:License.Kill PROCEDURE

  CODE
  _Hide:Access:License.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:License &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:License)                            ! destroy the file manager


Hide:Relate:Geometries.Init PROCEDURE()
  CODE
  _Hide:Access:Geometries.Init
  SELF.Init(Access:Geometries,1)


Hide:Access:Geometries.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GEO:Record
  SELF.FileNameValue = 'Geometries'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Geometries
  PARENT.Init
  Access:Geometries &= SELF


Hide:Access:Geometries.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Geometries &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Geometries.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Geometries,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GEO:ID_Geometries_Key,'GEO:ID_Geometries_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Geometries.Kill PROCEDURE

  CODE
  _Hide:Access:Geometries.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:Geometries &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Geometries)                         ! destroy the file manager


Hide:Relate:Themes.Init PROCEDURE()
  CODE
  _Hide:Access:Themes.Init
  SELF.Init(Access:Themes,1)


Hide:Access:Themes.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= THM:Record
  SELF.FileNameValue = 'Themes'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Themes
  PARENT.Init
  Access:Themes &= SELF


Hide:Access:Themes.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Themes &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Themes.PrimeFields PROCEDURE

  CODE
  THM:Neurons_Area = 71                                    ! Assign initial field value
  THM:Gradient_Options = 'Single'                          ! Assign initial field value
  THM:Gradient_Orientation = 'Single'                      ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Themes.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Themes,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(THM:ID_Theme_Color_Key,'THM:ID_Theme_Color_Key',1)
    SELF.AddKey(THM:Theme_Name_Key,'THM:Theme_Name_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Themes.Kill PROCEDURE

  CODE
  _Hide:Access:Themes.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Themes &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Themes)                             ! destroy the file manager


Hide:Relate:Thoughts.Init PROCEDURE()
  CODE
  _Hide:Access:Thoughts.Init
  SELF.Init(Access:Thoughts,1)


Hide:Access:Thoughts.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= THO:Record
  SELF.FileNameValue = 'Thoughts'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Thoughts
  PARENT.Init
  Access:Thoughts &= SELF


Hide:Access:Thoughts.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Thoughts &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Thoughts.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Thoughts,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(THO:Tought_ID_Key,'THO:Tought_ID_Key',1)
    SELF.AddKey(THO:Tought_Key,'THO:Tought_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Thoughts.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Neurons,RI:CASCADE,RI:CASCADE,NEU:Tought_ID_Key)
  SELF.AddRelationLink(THO:Thought_ID,NEU:Thought_ID)


Hide:Relate:Thoughts.Kill PROCEDURE

  CODE
  _Hide:Access:Thoughts.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Thoughts &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Thoughts)                           ! destroy the file manager


Hide:Relate:Lists.Init PROCEDURE()
  CODE
  _Hide:Access:Lists.Init
  SELF.Init(Access:Lists,1)


Hide:Access:Lists.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIS:Record
  SELF.FileNameValue = 'Lists'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Lists
  PARENT.Init
  Access:Lists &= SELF


Hide:Access:Lists.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Lists &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Lists.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Lists,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LIS:Neuron_ID_Key,'LIS:Neuron_ID_Key',0)
    SELF.AddKey(LIS:List_ID_Key,'LIS:List_ID_Key',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Lists.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Neurons)


Hide:Relate:Lists.Kill PROCEDURE

  CODE
  _Hide:Access:Lists.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:Lists &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Lists)                              ! destroy the file manager


Hide:Relate:A_Neurons.Init PROCEDURE()
  CODE
  _Hide:Access:A_Neurons.Init
  SELF.Init(Access:A_Neurons,1)
  SELF.SetAlias(Relate:Neurons)


Hide:Access:A_Neurons.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= A_NEU:Record
  SELF.AliasedFile &= Access:Neurons                       !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'A_Neurons'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= A_Neurons
  PARENT.Init
  Access:A_Neurons &= SELF


Hide:Access:A_Neurons.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:A_Neurons &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:A_Neurons.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(A_Neurons,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(A_NEU:Tought_ID_Key,'A_NEU:Tought_ID_Key',0)
    SELF.AddKey(A_NEU:Neuron_ID_Key,'A_NEU:Neuron_ID_Key',1)
    SELF.AddKey(A_NEU:Neuron_Parent_ID_Key,'A_NEU:Neuron_Parent_ID_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:A_Neurons.Kill PROCEDURE

  CODE
  _Hide:Access:A_Neurons.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:A_Neurons &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:A_Neurons)                          ! destroy the file manager

