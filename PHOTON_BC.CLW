  MEMBER('Photon.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('Photon_BC0.CLW')
Photon_BC0:DctInit             PROCEDURE()
Photon_BC0:DctKill             PROCEDURE()
Photon_BC0:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  Photon_BC0:DctInit
  Photon_BC0:FilesInit


DctKill PROCEDURE()
  CODE
  Photon_BC0:DctKill

