
DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonX;

CREATE TABLE test_csv.PersonX (`idPersonStatus_String` VARCHAR(100), `AddressPrivateCity` VARCHAR(100), `Salutation` VARCHAR(100), `idCompany` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `idJobFunction_String_List_BeforePrevious` TEXT, `AddressPrivate2PostCode` VARCHAR(100), `Initials` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `AddressPrivate2Country` VARCHAR(100), `idCountry3` VARCHAR(100), `DateOfBirth` DATE, `PhoneOther` VARCHAR(100), `JobTitle` VARCHAR(100), `Department` VARCHAR(100), `Package` VARCHAR(100), `AddressPrivate2City` VARCHAR(100), `idMarkForDeletion_String` VARCHAR(100), `LastAttachmentDate` DATE, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `URLPrivate2` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `AddressOtherCountyState` VARCHAR(100), `OriginOfData` VARCHAR(100), `JobNotes` TEXT, `idRelocateLocation_String_List` TEXT, `idRelocate_String` VARCHAR(100), `AddressPrivateCountry` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `KeyContact` BIT, `DefaultPhone` VARCHAR(100), `OwningUser` VARCHAR(100), `DefaultURL` TEXT, `AddressDefaultFull` TEXT, `ProcessingReasonValue_String` VARCHAR(100), `Salary` VARCHAR(100), `OriginalTraining` VARCHAR(100), `idPersonOrigin_String` VARCHAR(100), `idPreferredEmploymentType_String` VARCHAR(100), `idLanguage_String_List_Current` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `idProcessingReason_String` VARCHAR(100), `AddressOtherCity` VARCHAR(100), `DirectLinePhone` VARCHAR(100), `ProcessingStatusBy` VARCHAR(100), `FaxBusiness` VARCHAR(100), `idIndustry_String_List_BeforePrevious` TEXT, `URLPrivate` TEXT, `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `idJobFunction_String_List` TEXT, `AddressOtherCountry` VARCHAR(100), `IsOffLimit` BIT, `MinimumRequiredRate` VARCHAR(100), `PreviousJobTitle` VARCHAR(100), `idLanguage_String_List` VARCHAR(100), `AddressOtherFull` VARCHAR(100), `URLOther` VARCHAR(100), `idLanguage_String_List_Previous` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `idPersonCommunicationType4` VARCHAR(100), `idPersonCommunicationType2` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ProcessingStatusValue_String` VARCHAR(100), `PersonReference` VARCHAR(100), `idQualification_String_List_Current` VARCHAR(100), `idProcessingStatus_String` VARCHAR(100), `idQualification_String_List` TEXT, `idCountry1` VARCHAR(100), `Default_Write_to` BIT, `AlertTextAlert` BIT, `idInternational_String_List_Current` VARCHAR(100), `PreviousCompanyToDate` DATE, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `ComplianceStartDate` VARCHAR(100), `Division` VARCHAR(100), `idPreviousCandidate_String` VARCHAR(100), `idQualification_String_List_BeforePrevious` VARCHAR(100), `AddressPrivate2CountyState` VARCHAR(100), `ProcessingStatusOn` VARCHAR(100), `idIndustry_String_List_Current` TEXT, `idPerson` VARCHAR(100), `FaxPrivate` VARCHAR(100), `idInternational_String_List` TEXT, `idUnitType_String` VARCHAR(100), `DefaultMobile` VARCHAR(100), `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idGender_String` VARCHAR(100), `MobilePrivate` VARCHAR(100), `isPrivateRecord` BIT, `FromDate` DATE, `AssociationRecordString` TEXT, `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `EmailOther` VARCHAR(100), `idContractorUnavailableReason_String` VARCHAR(100), `FaxOther` VARCHAR(100), `QualificationValue_String` VARCHAR(100), `DefaultFax` VARCHAR(100), `PreviousCompany` VARCHAR(100), `idPersonCommunicationType5` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `idLanguage_String_List_BeforePrevious` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `PhoneHome2` VARCHAR(100), `AddressPrivateFull` TEXT, `idUser_String_List` TEXT, `ToDate` DATE, `LanguageValue_String` VARCHAR(100), `PhoneHome` VARCHAR(100), `FirstName` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `idMaritalStatus_String` VARCHAR(100), `DefaultEmail` VARCHAR(100), `idTitle_String` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `idInternational_String_List_BeforePrevious` VARCHAR(100), `idPersonX` VARCHAR(100), `InternationalValue_String` VARCHAR(100), `AddressPrivate2Full` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `EmailPrivate` VARCHAR(100), `idTeam_String` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `idPersonCommunicationType3` VARCHAR(100), `MarketRate` VARCHAR(100), `idInternational_String_List_Previous` VARCHAR(100), `JobFunctionValue_String` VARCHAR(100), `idIndustry_String_List_Previous` TEXT, `FullName` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `HardCopyCv` VARCHAR(100), `idJobFunction_String_List_Previous` TEXT, `NationalityValue_String` VARCHAR(100), `PersonId` VARCHAR(100), `idLocation_String` VARCHAR(100), `idPerson_EAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `AddressDefaultPostCode` VARCHAR(100), `AddressPrivatePostCode` VARCHAR(100), `idTeam` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `AddressOtherPostCode` VARCHAR(100), `IdUser_Associate_String` VARCHAR(100), `IsComplete` BIT, `EmailPrivate2` VARCHAR(100), `idQualification_String_List_Previous` VARCHAR(100), `idUser` VARCHAR(100), `idPersonRating_String` VARCHAR(100), `MobilePrivate2` VARCHAR(100), `ModifiedOn` TIMESTAMP, `MobileOther` VARCHAR(100), `idNationality_String_List` VARCHAR(100), `RelocateLocation_String_List` VARCHAR(100), `idJobFunction_String_List_Current` TEXT, `AgencyCandidateId` VARCHAR(100), `EmailWork` VARCHAR(100), `PreviousDivision` VARCHAR(100), `MaidenName` VARCHAR(100), `MobileBusiness` VARCHAR(100), `idCompany1` VARCHAR(100), `BusinessPager` VARCHAR(100), `AddressPrivateCountyState` VARCHAR(100), `idPersonCommunicationType1` VARCHAR(100), `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonX;

CREATE TABLE test_csv.PersonX (`idPersonStatus_String` VARCHAR(100), `AddressPrivateCity` VARCHAR(100), `Salutation` VARCHAR(100), `idCompany` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `idJobFunction_String_List_BeforePrevious` TEXT, `AddressPrivate2PostCode` VARCHAR(100), `Initials` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `AddressPrivate2Country` VARCHAR(100), `idCountry3` VARCHAR(100), `DateOfBirth` DATE, `PhoneOther` VARCHAR(100), `JobTitle` VARCHAR(100), `Department` VARCHAR(100), `Package` VARCHAR(100), `AddressPrivate2City` VARCHAR(100), `idMarkForDeletion_String` VARCHAR(100), `LastAttachmentDate` DATE, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `URLPrivate2` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `AddressOtherCountyState` VARCHAR(100), `OriginOfData` VARCHAR(100), `JobNotes` TEXT, `idRelocateLocation_String_List` TEXT, `idRelocate_String` VARCHAR(100), `AddressPrivateCountry` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `KeyContact` BIT, `DefaultPhone` VARCHAR(100), `OwningUser` VARCHAR(100), `DefaultURL` TEXT, `AddressDefaultFull` TEXT, `ProcessingReasonValue_String` VARCHAR(100), `Salary` VARCHAR(100), `OriginalTraining` VARCHAR(100), `idPersonOrigin_String` VARCHAR(100), `idPreferredEmploymentType_String` VARCHAR(100), `idLanguage_String_List_Current` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `idProcessingReason_String` VARCHAR(100), `AddressOtherCity` VARCHAR(100), `DirectLinePhone` VARCHAR(100), `ProcessingStatusBy` VARCHAR(100), `FaxBusiness` VARCHAR(100), `idIndustry_String_List_BeforePrevious` TEXT, `URLPrivate` TEXT, `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `idJobFunction_String_List` TEXT, `AddressOtherCountry` VARCHAR(100), `IsOffLimit` BIT, `MinimumRequiredRate` VARCHAR(100), `PreviousJobTitle` VARCHAR(100), `idLanguage_String_List` VARCHAR(100), `AddressOtherFull` VARCHAR(100), `URLOther` VARCHAR(100), `idLanguage_String_List_Previous` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `idPersonCommunicationType4` VARCHAR(100), `idPersonCommunicationType2` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ProcessingStatusValue_String` VARCHAR(100), `PersonReference` VARCHAR(100), `idQualification_String_List_Current` VARCHAR(100), `idProcessingStatus_String` VARCHAR(100), `idQualification_String_List` TEXT, `idCountry1` VARCHAR(100), `Default_Write_to` BIT, `AlertTextAlert` BIT, `idInternational_String_List_Current` VARCHAR(100), `PreviousCompanyToDate` DATE, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `ComplianceStartDate` VARCHAR(100), `Division` VARCHAR(100), `idPreviousCandidate_String` VARCHAR(100), `idQualification_String_List_BeforePrevious` VARCHAR(100), `AddressPrivate2CountyState` VARCHAR(100), `ProcessingStatusOn` VARCHAR(100), `idIndustry_String_List_Current` TEXT, `idPerson` VARCHAR(100), `FaxPrivate` VARCHAR(100), `idInternational_String_List` TEXT, `idUnitType_String` VARCHAR(100), `DefaultMobile` VARCHAR(100), `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idGender_String` VARCHAR(100), `MobilePrivate` VARCHAR(100), `isPrivateRecord` BIT, `FromDate` DATE, `AssociationRecordString` TEXT, `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `EmailOther` VARCHAR(100), `idContractorUnavailableReason_String` VARCHAR(100), `FaxOther` VARCHAR(100), `QualificationValue_String` VARCHAR(100), `DefaultFax` VARCHAR(100), `PreviousCompany` VARCHAR(100), `idPersonCommunicationType5` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `idLanguage_String_List_BeforePrevious` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `PhoneHome2` VARCHAR(100), `AddressPrivateFull` TEXT, `idUser_String_List` TEXT, `ToDate` DATE, `LanguageValue_String` VARCHAR(100), `PhoneHome` VARCHAR(100), `FirstName` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `idMaritalStatus_String` VARCHAR(100), `DefaultEmail` VARCHAR(100), `idTitle_String` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `idInternational_String_List_BeforePrevious` VARCHAR(100), `idPersonX` VARCHAR(100), `InternationalValue_String` VARCHAR(100), `AddressPrivate2Full` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `EmailPrivate` VARCHAR(100), `idTeam_String` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `idPersonCommunicationType3` VARCHAR(100), `MarketRate` VARCHAR(100), `idInternational_String_List_Previous` VARCHAR(100), `JobFunctionValue_String` VARCHAR(100), `idIndustry_String_List_Previous` TEXT, `FullName` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `HardCopyCv` VARCHAR(100), `idJobFunction_String_List_Previous` TEXT, `NationalityValue_String` VARCHAR(100), `PersonId` VARCHAR(100), `idLocation_String` VARCHAR(100), `idPerson_EAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `AddressDefaultPostCode` VARCHAR(100), `AddressPrivatePostCode` VARCHAR(100), `idTeam` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `AddressOtherPostCode` VARCHAR(100), `IdUser_Associate_String` VARCHAR(100), `IsComplete` BIT, `EmailPrivate2` VARCHAR(100), `idQualification_String_List_Previous` VARCHAR(100), `idUser` VARCHAR(100), `idPersonRating_String` VARCHAR(100), `MobilePrivate2` VARCHAR(100), `ModifiedOn` TIMESTAMP, `MobileOther` VARCHAR(100), `idNationality_String_List` VARCHAR(100), `RelocateLocation_String_List` VARCHAR(100), `idJobFunction_String_List_Current` TEXT, `AgencyCandidateId` VARCHAR(100), `EmailWork` VARCHAR(100), `PreviousDivision` VARCHAR(100), `MaidenName` VARCHAR(100), `MobileBusiness` VARCHAR(100), `idCompany1` VARCHAR(100), `BusinessPager` VARCHAR(100), `AddressPrivateCountyState` VARCHAR(100), `idPersonCommunicationType1` VARCHAR(100), `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonX;

CREATE TABLE test_csv.PersonX (`idPersonStatus_String` VARCHAR(100), `AddressPrivateCity` VARCHAR(100), `Salutation` VARCHAR(100), `idCompany` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `idJobFunction_String_List_BeforePrevious` TEXT, `AddressPrivate2PostCode` VARCHAR(100), `Initials` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `AddressPrivate2Country` VARCHAR(100), `idCountry3` VARCHAR(100), `DateOfBirth` DATE, `PhoneOther` VARCHAR(100), `JobTitle` VARCHAR(100), `Department` VARCHAR(100), `Package` VARCHAR(100), `AddressPrivate2City` VARCHAR(100), `idMarkForDeletion_String` VARCHAR(100), `LastAttachmentDate` DATE, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `URLPrivate2` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `AddressOtherCountyState` VARCHAR(100), `OriginOfData` VARCHAR(100), `JobNotes` TEXT, `idRelocateLocation_String_List` TEXT, `idRelocate_String` VARCHAR(100), `AddressPrivateCountry` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `KeyContact` BIT, `DefaultPhone` VARCHAR(100), `OwningUser` VARCHAR(100), `DefaultURL` TEXT, `AddressDefaultFull` TEXT, `ProcessingReasonValue_String` VARCHAR(100), `Salary` VARCHAR(100), `OriginalTraining` VARCHAR(100), `idPersonOrigin_String` VARCHAR(100), `idPreferredEmploymentType_String` VARCHAR(100), `idLanguage_String_List_Current` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `idProcessingReason_String` VARCHAR(100), `AddressOtherCity` VARCHAR(100), `DirectLinePhone` VARCHAR(100), `ProcessingStatusBy` VARCHAR(100), `FaxBusiness` VARCHAR(100), `idIndustry_String_List_BeforePrevious` TEXT, `URLPrivate` TEXT, `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `idJobFunction_String_List` TEXT, `AddressOtherCountry` VARCHAR(100), `IsOffLimit` BIT, `MinimumRequiredRate` VARCHAR(100), `PreviousJobTitle` VARCHAR(100), `idLanguage_String_List` VARCHAR(100), `AddressOtherFull` VARCHAR(100), `URLOther` VARCHAR(100), `idLanguage_String_List_Previous` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `idPersonCommunicationType4` VARCHAR(100), `idPersonCommunicationType2` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ProcessingStatusValue_String` VARCHAR(100), `PersonReference` VARCHAR(100), `idQualification_String_List_Current` VARCHAR(100), `idProcessingStatus_String` VARCHAR(100), `idQualification_String_List` TEXT, `idCountry1` VARCHAR(100), `Default_Write_to` BIT, `AlertTextAlert` BIT, `idInternational_String_List_Current` VARCHAR(100), `PreviousCompanyToDate` DATE, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `ComplianceStartDate` VARCHAR(100), `Division` VARCHAR(100), `idPreviousCandidate_String` VARCHAR(100), `idQualification_String_List_BeforePrevious` VARCHAR(100), `AddressPrivate2CountyState` VARCHAR(100), `ProcessingStatusOn` VARCHAR(100), `idIndustry_String_List_Current` TEXT, `idPerson` VARCHAR(100), `FaxPrivate` VARCHAR(100), `idInternational_String_List` TEXT, `idUnitType_String` VARCHAR(100), `DefaultMobile` VARCHAR(100), `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idGender_String` VARCHAR(100), `MobilePrivate` VARCHAR(100), `isPrivateRecord` BIT, `FromDate` DATE, `AssociationRecordString` TEXT, `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `EmailOther` VARCHAR(100), `idContractorUnavailableReason_String` VARCHAR(100), `FaxOther` VARCHAR(100), `QualificationValue_String` VARCHAR(100), `DefaultFax` VARCHAR(100), `PreviousCompany` VARCHAR(100), `idPersonCommunicationType5` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `idLanguage_String_List_BeforePrevious` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `PhoneHome2` VARCHAR(100), `AddressPrivateFull` TEXT, `idUser_String_List` TEXT, `ToDate` DATE, `LanguageValue_String` VARCHAR(100), `PhoneHome` VARCHAR(100), `FirstName` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `idMaritalStatus_String` VARCHAR(100), `DefaultEmail` VARCHAR(100), `idTitle_String` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `idInternational_String_List_BeforePrevious` VARCHAR(100), `idPersonX` VARCHAR(100), `InternationalValue_String` VARCHAR(100), `AddressPrivate2Full` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `EmailPrivate` VARCHAR(100), `idTeam_String` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `idPersonCommunicationType3` VARCHAR(100), `MarketRate` VARCHAR(100), `idInternational_String_List_Previous` VARCHAR(100), `JobFunctionValue_String` VARCHAR(100), `idIndustry_String_List_Previous` TEXT, `FullName` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `HardCopyCv` VARCHAR(100), `idJobFunction_String_List_Previous` TEXT, `NationalityValue_String` VARCHAR(100), `PersonId` VARCHAR(100), `idLocation_String` VARCHAR(100), `idPerson_EAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `AddressDefaultPostCode` VARCHAR(100), `AddressPrivatePostCode` VARCHAR(100), `idTeam` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `AddressOtherPostCode` VARCHAR(100), `IdUser_Associate_String` VARCHAR(100), `IsComplete` BIT, `EmailPrivate2` VARCHAR(100), `idQualification_String_List_Previous` VARCHAR(100), `idUser` VARCHAR(100), `idPersonRating_String` VARCHAR(100), `MobilePrivate2` VARCHAR(100), `ModifiedOn` TIMESTAMP, `MobileOther` VARCHAR(100), `idNationality_String_List` VARCHAR(100), `RelocateLocation_String_List` VARCHAR(100), `idJobFunction_String_List_Current` TEXT, `AgencyCandidateId` VARCHAR(100), `EmailWork` VARCHAR(100), `PreviousDivision` VARCHAR(100), `MaidenName` VARCHAR(100), `MobileBusiness` VARCHAR(100), `idCompany1` VARCHAR(100), `BusinessPager` VARCHAR(100), `AddressPrivateCountyState` VARCHAR(100), `idPersonCommunicationType1` VARCHAR(100), `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonX;

CREATE TABLE test_csv.PersonX (`idPersonStatus_String` VARCHAR(100), `AddressPrivateCity` VARCHAR(100), `Salutation` VARCHAR(100), `idCompany` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `idJobFunction_String_List_BeforePrevious` TEXT, `AddressPrivate2PostCode` VARCHAR(100), `Initials` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `AddressPrivate2Country` VARCHAR(100), `idCountry3` VARCHAR(100), `DateOfBirth` DATE, `PhoneOther` VARCHAR(100), `JobTitle` VARCHAR(100), `Department` VARCHAR(100), `Package` VARCHAR(100), `AddressPrivate2City` VARCHAR(100), `idMarkForDeletion_String` VARCHAR(100), `LastAttachmentDate` DATE, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `URLPrivate2` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `AddressOtherCountyState` VARCHAR(100), `OriginOfData` VARCHAR(100), `JobNotes` TEXT, `idRelocateLocation_String_List` TEXT, `idRelocate_String` VARCHAR(100), `AddressPrivateCountry` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `KeyContact` BIT, `DefaultPhone` VARCHAR(100), `OwningUser` VARCHAR(100), `DefaultURL` TEXT, `AddressDefaultFull` TEXT, `ProcessingReasonValue_String` VARCHAR(100), `Salary` VARCHAR(100), `OriginalTraining` VARCHAR(100), `idPersonOrigin_String` VARCHAR(100), `idPreferredEmploymentType_String` VARCHAR(100), `idLanguage_String_List_Current` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `idProcessingReason_String` VARCHAR(100), `AddressOtherCity` VARCHAR(100), `DirectLinePhone` VARCHAR(100), `ProcessingStatusBy` VARCHAR(100), `FaxBusiness` VARCHAR(100), `idIndustry_String_List_BeforePrevious` TEXT, `URLPrivate` TEXT, `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `idJobFunction_String_List` TEXT, `AddressOtherCountry` VARCHAR(100), `IsOffLimit` BIT, `MinimumRequiredRate` VARCHAR(100), `PreviousJobTitle` VARCHAR(100), `idLanguage_String_List` VARCHAR(100), `AddressOtherFull` VARCHAR(100), `URLOther` VARCHAR(100), `idLanguage_String_List_Previous` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `idPersonCommunicationType4` VARCHAR(100), `idPersonCommunicationType2` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ProcessingStatusValue_String` VARCHAR(100), `PersonReference` VARCHAR(100), `idQualification_String_List_Current` VARCHAR(100), `idProcessingStatus_String` VARCHAR(100), `idQualification_String_List` TEXT, `idCountry1` VARCHAR(100), `Default_Write_to` BIT, `AlertTextAlert` BIT, `idInternational_String_List_Current` VARCHAR(100), `PreviousCompanyToDate` DATE, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `ComplianceStartDate` VARCHAR(100), `Division` VARCHAR(100), `idPreviousCandidate_String` VARCHAR(100), `idQualification_String_List_BeforePrevious` VARCHAR(100), `AddressPrivate2CountyState` VARCHAR(100), `ProcessingStatusOn` VARCHAR(100), `idIndustry_String_List_Current` TEXT, `idPerson` VARCHAR(100), `FaxPrivate` VARCHAR(100), `idInternational_String_List` TEXT, `idUnitType_String` VARCHAR(100), `DefaultMobile` VARCHAR(100), `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idGender_String` VARCHAR(100), `MobilePrivate` VARCHAR(100), `isPrivateRecord` BIT, `FromDate` DATE, `AssociationRecordString` TEXT, `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `EmailOther` VARCHAR(100), `idContractorUnavailableReason_String` VARCHAR(100), `FaxOther` VARCHAR(100), `QualificationValue_String` VARCHAR(100), `DefaultFax` VARCHAR(100), `PreviousCompany` VARCHAR(100), `idPersonCommunicationType5` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `idLanguage_String_List_BeforePrevious` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `PhoneHome2` VARCHAR(100), `AddressPrivateFull` TEXT, `idUser_String_List` TEXT, `ToDate` DATE, `LanguageValue_String` VARCHAR(100), `PhoneHome` VARCHAR(100), `FirstName` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `idMaritalStatus_String` VARCHAR(100), `DefaultEmail` VARCHAR(100), `idTitle_String` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `idInternational_String_List_BeforePrevious` VARCHAR(100), `idPersonX` VARCHAR(100), `InternationalValue_String` VARCHAR(100), `AddressPrivate2Full` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `EmailPrivate` VARCHAR(100), `idTeam_String` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `idPersonCommunicationType3` VARCHAR(100), `MarketRate` VARCHAR(100), `idInternational_String_List_Previous` VARCHAR(100), `JobFunctionValue_String` VARCHAR(100), `idIndustry_String_List_Previous` TEXT, `FullName` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `HardCopyCv` VARCHAR(100), `idJobFunction_String_List_Previous` TEXT, `NationalityValue_String` VARCHAR(100), `PersonId` VARCHAR(100), `idLocation_String` VARCHAR(100), `idPerson_EAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `AddressDefaultPostCode` VARCHAR(100), `AddressPrivatePostCode` VARCHAR(100), `idTeam` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `AddressOtherPostCode` VARCHAR(100), `IdUser_Associate_String` VARCHAR(100), `IsComplete` BIT, `EmailPrivate2` VARCHAR(100), `idQualification_String_List_Previous` VARCHAR(100), `idUser` VARCHAR(100), `idPersonRating_String` VARCHAR(100), `MobilePrivate2` VARCHAR(100), `ModifiedOn` TIMESTAMP, `MobileOther` VARCHAR(100), `idNationality_String_List` VARCHAR(100), `RelocateLocation_String_List` VARCHAR(100), `idJobFunction_String_List_Current` TEXT, `AgencyCandidateId` VARCHAR(100), `EmailWork` VARCHAR(100), `PreviousDivision` VARCHAR(100), `MaidenName` VARCHAR(100), `MobileBusiness` VARCHAR(100), `idCompany1` VARCHAR(100), `BusinessPager` VARCHAR(100), `AddressPrivateCountyState` VARCHAR(100), `idPersonCommunicationType1` VARCHAR(100), `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonX;

CREATE TABLE test_csv.PersonX (`idPersonStatus_String` VARCHAR(100), `AddressPrivateCity` VARCHAR(100), `Salutation` VARCHAR(100), `idCompany` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `idJobFunction_String_List_BeforePrevious` TEXT, `AddressPrivate2PostCode` VARCHAR(100), `Initials` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `AddressPrivate2Country` VARCHAR(100), `idCountry3` VARCHAR(100), `DateOfBirth` DATE, `PhoneOther` VARCHAR(100), `JobTitle` VARCHAR(100), `Department` VARCHAR(100), `Package` VARCHAR(100), `AddressPrivate2City` VARCHAR(100), `idMarkForDeletion_String` VARCHAR(100), `LastAttachmentDate` DATE, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `URLPrivate2` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `AddressOtherCountyState` VARCHAR(100), `OriginOfData` VARCHAR(100), `JobNotes` TEXT, `idRelocateLocation_String_List` TEXT, `idRelocate_String` VARCHAR(100), `AddressPrivateCountry` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `KeyContact` BIT, `DefaultPhone` VARCHAR(100), `OwningUser` VARCHAR(100), `DefaultURL` TEXT, `AddressDefaultFull` TEXT, `ProcessingReasonValue_String` VARCHAR(100), `Salary` VARCHAR(100), `OriginalTraining` VARCHAR(100), `idPersonOrigin_String` VARCHAR(100), `idPreferredEmploymentType_String` VARCHAR(100), `idLanguage_String_List_Current` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `idProcessingReason_String` VARCHAR(100), `AddressOtherCity` VARCHAR(100), `DirectLinePhone` VARCHAR(100), `ProcessingStatusBy` VARCHAR(100), `FaxBusiness` VARCHAR(100), `idIndustry_String_List_BeforePrevious` TEXT, `URLPrivate` TEXT, `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `idJobFunction_String_List` TEXT, `AddressOtherCountry` VARCHAR(100), `IsOffLimit` BIT, `MinimumRequiredRate` VARCHAR(100), `PreviousJobTitle` VARCHAR(100), `idLanguage_String_List` VARCHAR(100), `AddressOtherFull` VARCHAR(100), `URLOther` VARCHAR(100), `idLanguage_String_List_Previous` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `idPersonCommunicationType4` VARCHAR(100), `idPersonCommunicationType2` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ProcessingStatusValue_String` VARCHAR(100), `PersonReference` VARCHAR(100), `idQualification_String_List_Current` VARCHAR(100), `idProcessingStatus_String` VARCHAR(100), `idQualification_String_List` TEXT, `idCountry1` VARCHAR(100), `Default_Write_to` BIT, `AlertTextAlert` BIT, `idInternational_String_List_Current` VARCHAR(100), `PreviousCompanyToDate` DATE, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `ComplianceStartDate` VARCHAR(100), `Division` VARCHAR(100), `idPreviousCandidate_String` VARCHAR(100), `idQualification_String_List_BeforePrevious` VARCHAR(100), `AddressPrivate2CountyState` VARCHAR(100), `ProcessingStatusOn` VARCHAR(100), `idIndustry_String_List_Current` TEXT, `idPerson` VARCHAR(100), `FaxPrivate` VARCHAR(100), `idInternational_String_List` TEXT, `idUnitType_String` VARCHAR(100), `DefaultMobile` VARCHAR(100), `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idGender_String` VARCHAR(100), `MobilePrivate` VARCHAR(100), `isPrivateRecord` BIT, `FromDate` DATE, `AssociationRecordString` TEXT, `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `EmailOther` VARCHAR(100), `idContractorUnavailableReason_String` VARCHAR(100), `FaxOther` VARCHAR(100), `QualificationValue_String` VARCHAR(100), `DefaultFax` VARCHAR(100), `PreviousCompany` VARCHAR(100), `idPersonCommunicationType5` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `idLanguage_String_List_BeforePrevious` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `PhoneHome2` VARCHAR(100), `AddressPrivateFull` TEXT, `idUser_String_List` TEXT, `ToDate` DATE, `LanguageValue_String` VARCHAR(100), `PhoneHome` VARCHAR(100), `FirstName` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `idMaritalStatus_String` VARCHAR(100), `DefaultEmail` VARCHAR(100), `idTitle_String` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `idInternational_String_List_BeforePrevious` VARCHAR(100), `idPersonX` VARCHAR(100), `InternationalValue_String` VARCHAR(100), `AddressPrivate2Full` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `EmailPrivate` VARCHAR(100), `idTeam_String` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `idPersonCommunicationType3` VARCHAR(100), `MarketRate` VARCHAR(100), `idInternational_String_List_Previous` VARCHAR(100), `JobFunctionValue_String` VARCHAR(100), `idIndustry_String_List_Previous` TEXT, `FullName` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `HardCopyCv` VARCHAR(100), `idJobFunction_String_List_Previous` TEXT, `NationalityValue_String` VARCHAR(100), `PersonId` VARCHAR(100), `idLocation_String` VARCHAR(100), `idPerson_EAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `AddressDefaultPostCode` VARCHAR(100), `AddressPrivatePostCode` VARCHAR(100), `idTeam` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `AddressOtherPostCode` VARCHAR(100), `IdUser_Associate_String` VARCHAR(100), `IsComplete` BIT, `EmailPrivate2` VARCHAR(100), `idQualification_String_List_Previous` VARCHAR(100), `idUser` VARCHAR(100), `idPersonRating_String` VARCHAR(100), `MobilePrivate2` VARCHAR(100), `ModifiedOn` TIMESTAMP, `MobileOther` VARCHAR(100), `idNationality_String_List` VARCHAR(100), `RelocateLocation_String_List` VARCHAR(100), `idJobFunction_String_List_Current` TEXT, `AgencyCandidateId` VARCHAR(100), `EmailWork` VARCHAR(100), `PreviousDivision` VARCHAR(100), `MaidenName` VARCHAR(100), `MobileBusiness` VARCHAR(100), `idCompany1` VARCHAR(100), `BusinessPager` VARCHAR(100), `AddressPrivateCountyState` VARCHAR(100), `idPersonCommunicationType1` VARCHAR(100), `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonX;

CREATE TABLE test_csv.PersonX (`idPersonStatus_String` VARCHAR(100), `AddressPrivateCity` VARCHAR(100), `Salutation` VARCHAR(100), `idCompany` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `idJobFunction_String_List_BeforePrevious` TEXT, `AddressPrivate2PostCode` VARCHAR(100), `Initials` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `AddressPrivate2Country` VARCHAR(100), `idCountry3` VARCHAR(100), `DateOfBirth` DATE, `PhoneOther` VARCHAR(100), `JobTitle` VARCHAR(100), `Department` VARCHAR(100), `Package` VARCHAR(100), `AddressPrivate2City` VARCHAR(100), `idMarkForDeletion_String` VARCHAR(100), `LastAttachmentDate` DATE, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `URLPrivate2` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `AddressOtherCountyState` VARCHAR(100), `OriginOfData` VARCHAR(100), `JobNotes` TEXT, `idRelocateLocation_String_List` TEXT, `idRelocate_String` VARCHAR(100), `AddressPrivateCountry` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `KeyContact` BIT, `DefaultPhone` VARCHAR(100), `OwningUser` VARCHAR(100), `DefaultURL` TEXT, `AddressDefaultFull` TEXT, `ProcessingReasonValue_String` VARCHAR(100), `Salary` VARCHAR(100), `OriginalTraining` VARCHAR(100), `idPersonOrigin_String` VARCHAR(100), `idPreferredEmploymentType_String` VARCHAR(100), `idLanguage_String_List_Current` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `idProcessingReason_String` VARCHAR(100), `AddressOtherCity` VARCHAR(100), `DirectLinePhone` VARCHAR(100), `ProcessingStatusBy` VARCHAR(100), `FaxBusiness` VARCHAR(100), `idIndustry_String_List_BeforePrevious` TEXT, `URLPrivate` TEXT, `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `idJobFunction_String_List` TEXT, `AddressOtherCountry` VARCHAR(100), `IsOffLimit` BIT, `MinimumRequiredRate` VARCHAR(100), `PreviousJobTitle` VARCHAR(100), `idLanguage_String_List` VARCHAR(100), `AddressOtherFull` VARCHAR(100), `URLOther` VARCHAR(100), `idLanguage_String_List_Previous` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `idPersonCommunicationType4` VARCHAR(100), `idPersonCommunicationType2` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ProcessingStatusValue_String` VARCHAR(100), `PersonReference` VARCHAR(100), `idQualification_String_List_Current` VARCHAR(100), `idProcessingStatus_String` VARCHAR(100), `idQualification_String_List` TEXT, `idCountry1` VARCHAR(100), `Default_Write_to` BIT, `AlertTextAlert` BIT, `idInternational_String_List_Current` VARCHAR(100), `PreviousCompanyToDate` DATE, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `ComplianceStartDate` VARCHAR(100), `Division` VARCHAR(100), `idPreviousCandidate_String` VARCHAR(100), `idQualification_String_List_BeforePrevious` VARCHAR(100), `AddressPrivate2CountyState` VARCHAR(100), `ProcessingStatusOn` VARCHAR(100), `idIndustry_String_List_Current` TEXT, `idPerson` VARCHAR(100), `FaxPrivate` VARCHAR(100), `idInternational_String_List` TEXT, `idUnitType_String` VARCHAR(100), `DefaultMobile` VARCHAR(100), `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idGender_String` VARCHAR(100), `MobilePrivate` VARCHAR(100), `isPrivateRecord` BIT, `FromDate` DATE, `AssociationRecordString` TEXT, `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `EmailOther` VARCHAR(100), `idContractorUnavailableReason_String` VARCHAR(100), `FaxOther` VARCHAR(100), `QualificationValue_String` VARCHAR(100), `DefaultFax` VARCHAR(100), `PreviousCompany` VARCHAR(100), `idPersonCommunicationType5` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `idLanguage_String_List_BeforePrevious` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `PhoneHome2` VARCHAR(100), `AddressPrivateFull` TEXT, `idUser_String_List` TEXT, `ToDate` DATE, `LanguageValue_String` VARCHAR(100), `PhoneHome` VARCHAR(100), `FirstName` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `idMaritalStatus_String` VARCHAR(100), `DefaultEmail` VARCHAR(100), `idTitle_String` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `idInternational_String_List_BeforePrevious` VARCHAR(100), `idPersonX` VARCHAR(100), `InternationalValue_String` VARCHAR(100), `AddressPrivate2Full` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `EmailPrivate` VARCHAR(100), `idTeam_String` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `idPersonCommunicationType3` VARCHAR(100), `MarketRate` VARCHAR(100), `idInternational_String_List_Previous` VARCHAR(100), `JobFunctionValue_String` VARCHAR(100), `idIndustry_String_List_Previous` TEXT, `FullName` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `HardCopyCv` VARCHAR(100), `idJobFunction_String_List_Previous` TEXT, `NationalityValue_String` VARCHAR(100), `PersonId` VARCHAR(100), `idLocation_String` VARCHAR(100), `idPerson_EAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `AddressDefaultPostCode` VARCHAR(100), `AddressPrivatePostCode` VARCHAR(100), `idTeam` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `AddressOtherPostCode` VARCHAR(100), `IdUser_Associate_String` VARCHAR(100), `IsComplete` BIT, `EmailPrivate2` VARCHAR(100), `idQualification_String_List_Previous` VARCHAR(100), `idUser` VARCHAR(100), `idPersonRating_String` VARCHAR(100), `MobilePrivate2` VARCHAR(100), `ModifiedOn` TIMESTAMP, `MobileOther` VARCHAR(100), `idNationality_String_List` VARCHAR(100), `RelocateLocation_String_List` VARCHAR(100), `idJobFunction_String_List_Current` TEXT, `AgencyCandidateId` VARCHAR(100), `EmailWork` VARCHAR(100), `PreviousDivision` VARCHAR(100), `MaidenName` VARCHAR(100), `MobileBusiness` VARCHAR(100), `idCompany1` VARCHAR(100), `BusinessPager` VARCHAR(100), `AddressPrivateCountyState` VARCHAR(100), `idPersonCommunicationType1` VARCHAR(100), `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonX;

CREATE TABLE test_csv.PersonX (`idPersonStatus_String` VARCHAR(100), `AddressPrivateCity` VARCHAR(100), `Salutation` VARCHAR(100), `idCompany` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `idJobFunction_String_List_BeforePrevious` TEXT, `AddressPrivate2PostCode` VARCHAR(100), `Initials` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `AddressPrivate2Country` VARCHAR(100), `idCountry3` VARCHAR(100), `DateOfBirth` DATE, `PhoneOther` VARCHAR(100), `JobTitle` VARCHAR(100), `Department` VARCHAR(100), `Package` VARCHAR(100), `AddressPrivate2City` VARCHAR(100), `idMarkForDeletion_String` VARCHAR(100), `LastAttachmentDate` DATE, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `URLPrivate2` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `AddressOtherCountyState` VARCHAR(100), `OriginOfData` VARCHAR(100), `JobNotes` TEXT, `idRelocateLocation_String_List` TEXT, `idRelocate_String` VARCHAR(100), `AddressPrivateCountry` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `KeyContact` BIT, `DefaultPhone` VARCHAR(100), `OwningUser` VARCHAR(100), `DefaultURL` TEXT, `AddressDefaultFull` TEXT, `ProcessingReasonValue_String` VARCHAR(100), `Salary` VARCHAR(100), `OriginalTraining` VARCHAR(100), `idPersonOrigin_String` VARCHAR(100), `idPreferredEmploymentType_String` VARCHAR(100), `idLanguage_String_List_Current` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `idProcessingReason_String` VARCHAR(100), `AddressOtherCity` VARCHAR(100), `DirectLinePhone` VARCHAR(100), `ProcessingStatusBy` VARCHAR(100), `FaxBusiness` VARCHAR(100), `idIndustry_String_List_BeforePrevious` TEXT, `URLPrivate` TEXT, `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `idJobFunction_String_List` TEXT, `AddressOtherCountry` VARCHAR(100), `IsOffLimit` BIT, `MinimumRequiredRate` VARCHAR(100), `PreviousJobTitle` VARCHAR(100), `idLanguage_String_List` VARCHAR(100), `AddressOtherFull` VARCHAR(100), `URLOther` VARCHAR(100), `idLanguage_String_List_Previous` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `idPersonCommunicationType4` VARCHAR(100), `idPersonCommunicationType2` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ProcessingStatusValue_String` VARCHAR(100), `PersonReference` VARCHAR(100), `idQualification_String_List_Current` VARCHAR(100), `idProcessingStatus_String` VARCHAR(100), `idQualification_String_List` TEXT, `idCountry1` VARCHAR(100), `Default_Write_to` BIT, `AlertTextAlert` BIT, `idInternational_String_List_Current` VARCHAR(100), `PreviousCompanyToDate` DATE, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `ComplianceStartDate` VARCHAR(100), `Division` VARCHAR(100), `idPreviousCandidate_String` VARCHAR(100), `idQualification_String_List_BeforePrevious` VARCHAR(100), `AddressPrivate2CountyState` VARCHAR(100), `ProcessingStatusOn` VARCHAR(100), `idIndustry_String_List_Current` TEXT, `idPerson` VARCHAR(100), `FaxPrivate` VARCHAR(100), `idInternational_String_List` TEXT, `idUnitType_String` VARCHAR(100), `DefaultMobile` VARCHAR(100), `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idGender_String` VARCHAR(100), `MobilePrivate` VARCHAR(100), `isPrivateRecord` BIT, `FromDate` DATE, `AssociationRecordString` TEXT, `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `EmailOther` VARCHAR(100), `idContractorUnavailableReason_String` VARCHAR(100), `FaxOther` VARCHAR(100), `QualificationValue_String` VARCHAR(100), `DefaultFax` VARCHAR(100), `PreviousCompany` VARCHAR(100), `idPersonCommunicationType5` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `idLanguage_String_List_BeforePrevious` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `PhoneHome2` VARCHAR(100), `AddressPrivateFull` TEXT, `idUser_String_List` TEXT, `ToDate` DATE, `LanguageValue_String` VARCHAR(100), `PhoneHome` VARCHAR(100), `FirstName` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `idMaritalStatus_String` VARCHAR(100), `DefaultEmail` VARCHAR(100), `idTitle_String` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `idInternational_String_List_BeforePrevious` VARCHAR(100), `idPersonX` VARCHAR(100), `InternationalValue_String` VARCHAR(100), `AddressPrivate2Full` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `EmailPrivate` VARCHAR(100), `idTeam_String` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `idPersonCommunicationType3` VARCHAR(100), `MarketRate` VARCHAR(100), `idInternational_String_List_Previous` VARCHAR(100), `JobFunctionValue_String` VARCHAR(100), `idIndustry_String_List_Previous` TEXT, `FullName` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `HardCopyCv` VARCHAR(100), `idJobFunction_String_List_Previous` TEXT, `NationalityValue_String` VARCHAR(100), `PersonId` VARCHAR(100), `idLocation_String` VARCHAR(100), `idPerson_EAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `AddressDefaultPostCode` VARCHAR(100), `AddressPrivatePostCode` VARCHAR(100), `idTeam` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `AddressOtherPostCode` VARCHAR(100), `IdUser_Associate_String` VARCHAR(100), `IsComplete` BIT, `EmailPrivate2` VARCHAR(100), `idQualification_String_List_Previous` VARCHAR(100), `idUser` VARCHAR(100), `idPersonRating_String` VARCHAR(100), `MobilePrivate2` VARCHAR(100), `ModifiedOn` TIMESTAMP, `MobileOther` VARCHAR(100), `idNationality_String_List` VARCHAR(100), `RelocateLocation_String_List` VARCHAR(100), `idJobFunction_String_List_Current` TEXT, `AgencyCandidateId` VARCHAR(100), `EmailWork` VARCHAR(100), `PreviousDivision` VARCHAR(100), `MaidenName` VARCHAR(100), `MobileBusiness` VARCHAR(100), `idCompany1` VARCHAR(100), `BusinessPager` VARCHAR(100), `AddressPrivateCountyState` VARCHAR(100), `idPersonCommunicationType1` VARCHAR(100), `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorExt;

CREATE TABLE test_csv.ContractorExt (`RowTimestamp` TIMESTAMP, `idContractor` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListMember;

CREATE TABLE test_csv.ListMember (`FoundInAlias` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `IsViewed` BIT, `PointerId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idListHeader` VARCHAR(100), `idListMember` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTarget;

CREATE TABLE test_csv.AssignmentTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Rank` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` DATE, `RowTimestamp` TIMESTAMP, `TargetNote` TEXT, `TargetNoteAlert` BIT, `idAssignment` VARCHAR(100), `idAssignmentTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonExt;

CREATE TABLE test_csv.PersonExt (`RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `udField1` VARCHAR(100), `udField2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EAddress;

CREATE TABLE test_csv.EAddress (`CommValue` TEXT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PersonExt;

CREATE TABLE test_csv.Company_PersonExt (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAssociate;

CREATE TABLE test_csv.PersonAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Document;

CREATE TABLE test_csv.Document (`Attachment` VARCHAR(100), `CheckedOutBy` VARCHAR(100), `CheckedOutOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` VARCHAR(100), `DocumentModifiedBy` VARCHAR(100), `DocumentModifiedOn` TIMESTAMP, `DocumentType` VARCHAR(100), `FilePath` VARCHAR(100), `IsOpenAsEdit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `NewDocumentName` VARCHAR(100), `OriginalDocumentName` TEXT, `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentLandmark;

CREATE TABLE test_csv.AssignmentLandmark (`ActualDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsLandmarkInvoiced` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateExt;

CREATE TABLE test_csv.AssignmentCandidateExt (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company;

CREATE TABLE test_csv.Company (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `PreferredSupplierAlert` BIT, `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `LastAttachmentDate` DATE, `OffLimitUntil` VARCHAR(100), `CompanyReference` VARCHAR(100), `ParentId` VARCHAR(100), `idLocation` VARCHAR(100), `idImport` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `idCompanyOrigin` VARCHAR(100), `ResearchedBy` VARCHAR(100), `LastIntelligenceDate` DATE, `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `ClientRelationshipNotesAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `RtfNote` TEXT, `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `RtfCompanyComment` TEXT, `CreatedOn` TIMESTAMP, `idAlertFlag` VARCHAR(100), `RevenueConversionRate` BIT, `RowTimestamp` TIMESTAMP, `RtfCompanyNote` TEXT, `Revenue` VARCHAR(100), `CompanyName` VARCHAR(100), `idCompanyStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `RtfClientRelationshipNotes` TEXT, `idCompanyRating` VARCHAR(100), `PreferredSupplier` TEXT, `CreatedBy` VARCHAR(100), `ResearchedOn` DATE, `idTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `CompanyComment` TEXT);


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonExt;

CREATE TABLE test_csv.PersonExt (`RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `udField1` VARCHAR(100), `udField2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTarget;

CREATE TABLE test_csv.AssignmentTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Rank` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` DATE, `RowTimestamp` TIMESTAMP, `TargetNote` TEXT, `TargetNoteAlert` BIT, `idAssignment` VARCHAR(100), `idAssignmentTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorExt;

CREATE TABLE test_csv.ContractorExt (`RowTimestamp` TIMESTAMP, `idContractor` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAssociate;

CREATE TABLE test_csv.PersonAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListMember;

CREATE TABLE test_csv.ListMember (`FoundInAlias` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `IsViewed` BIT, `PointerId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idListHeader` VARCHAR(100), `idListMember` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentLandmark;

CREATE TABLE test_csv.AssignmentLandmark (`ActualDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsLandmarkInvoiced` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EAddress;

CREATE TABLE test_csv.EAddress (`CommValue` TEXT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PersonExt;

CREATE TABLE test_csv.Company_PersonExt (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateExt;

CREATE TABLE test_csv.AssignmentCandidateExt (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Document;

CREATE TABLE test_csv.Document (`Attachment` VARCHAR(100), `CheckedOutBy` VARCHAR(100), `CheckedOutOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` VARCHAR(100), `DocumentModifiedBy` VARCHAR(100), `DocumentModifiedOn` TIMESTAMP, `DocumentType` VARCHAR(100), `FilePath` VARCHAR(100), `IsOpenAsEdit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `NewDocumentName` VARCHAR(100), `OriginalDocumentName` TEXT, `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company;

CREATE TABLE test_csv.Company (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `PreferredSupplierAlert` BIT, `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `LastAttachmentDate` DATE, `OffLimitUntil` VARCHAR(100), `CompanyReference` VARCHAR(100), `ParentId` VARCHAR(100), `idLocation` VARCHAR(100), `idImport` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `idCompanyOrigin` VARCHAR(100), `ResearchedBy` VARCHAR(100), `LastIntelligenceDate` DATE, `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `ClientRelationshipNotesAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `RtfNote` TEXT, `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `RtfCompanyComment` TEXT, `CreatedOn` TIMESTAMP, `idAlertFlag` VARCHAR(100), `RevenueConversionRate` BIT, `RowTimestamp` TIMESTAMP, `RtfCompanyNote` TEXT, `Revenue` VARCHAR(100), `CompanyName` VARCHAR(100), `idCompanyStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `RtfClientRelationshipNotes` TEXT, `idCompanyRating` VARCHAR(100), `PreferredSupplier` TEXT, `CreatedBy` VARCHAR(100), `ResearchedOn` DATE, `idTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `CompanyComment` TEXT);


DROP TABLE IF EXISTS test_csv.Person_EAddress;

CREATE TABLE test_csv.Person_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100), `idPerson_EAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Contractor;

CREATE TABLE test_csv.Contractor (`idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `MarketRateConversionRate` VARCHAR(100), `ContractorPaymentComment` VARCHAR(100), `ContractorAccountName` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100), `ContractorBankName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ContractorCompanyAddress` VARCHAR(100), `ContractorBranch` VARCHAR(100), `ContractorAvailabilityCommentAlert` BIT, `idUnitType` VARCHAR(100), `ContractorAvailabilityComment` VARCHAR(100), `MinimumRequiredRate` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ContractorAccountNumber` VARCHAR(100), `MinimumRequiredRateConversionRate` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RateInformationOn` VARCHAR(100), `BaseMinimumRequiredRate` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContractorNINumber` VARCHAR(100), `BaseMarketRate` VARCHAR(100), `ContractorPayrollNumber` VARCHAR(100), `ContractorCompanyName` VARCHAR(100), `ContractorCompanyRegistrationNumber` VARCHAR(100), `MarketRate` VARCHAR(100), `ContractorPaymentCommentAlert` BIT, `CreatedBy` VARCHAR(100), `idContractor` VARCHAR(100), `ContractorSortCode` VARCHAR(100), `idCurrency` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ContractorTaxCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCode_Company_Person;

CREATE TABLE test_csv.PersonCode_Company_Person (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100), `idPersonCode` VARCHAR(100), `idPersonCode_Company_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Candidate;

CREATE TABLE test_csv.Candidate (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `HardCopyCv` VARCHAR(100), `IsComplete` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idAlertFlag` VARCHAR(100), `idCandidate` VARCHAR(100), `idLocation` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOrigin` VARCHAR(100), `idPersonRating` VARCHAR(100), `idPersonStatus` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100), `idPreviousCandidate` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCode;

CREATE TABLE test_csv.PersonCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Remuneration;

CREATE TABLE test_csv.Remuneration (`idCurrency1` VARCHAR(100), `RemunerationOn` DATE, `BasePackage` VARCHAR(100), `idCompany_Person` VARCHAR(100), `LocalSalary` VARCHAR(100), `JobTitle` TEXT, `Package` VARCHAR(100), `Salary` VARCHAR(100), `ModifiedBy` VARCHAR(100), `PackageNoteAlert` BIT, `Bonus` VARCHAR(100), `IsDefault` BIT, `NoOfEmployees` VARCHAR(100), `PackageConversionRate` BIT, `CompanyRanking` VARCHAR(100), `PackageNote` TEXT, `NoteAlert` BIT, `ConversionRate` BIT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `BaseBonus` VARCHAR(100), `Industry` BIT, `CompanyRevenue` VARCHAR(100), `idRemuneration` VARCHAR(100), `CompanyName` VARCHAR(100), `BonusConversionRate` BIT, `SalaryConversionRate` BIT, `BaseSalary` VARCHAR(100), `Note` VARCHAR(100), `LocalPackage` VARCHAR(100), `JobFunction` BIT, `CreatedBy` VARCHAR(100), `RemunerationYear` VARCHAR(100), `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `ModifiedOn` TIMESTAMP);


DROP TABLE IF EXISTS test_csv.Company_Person;

CREATE TABLE test_csv.Company_Person (`idCompany` VARCHAR(100), `EmploymentTo` DATE, `idCompany_Person` VARCHAR(100), `LocalSalary` VARCHAR(100), `JobTitle` TEXT, `Department` VARCHAR(100), `Package` VARCHAR(100), `IsEstimatedEmploymentDate` BIT, `IsMatchedInSearch` BIT, `IsContractEmployment` BIT, `Salary` VARCHAR(100), `ModifiedBy` VARCHAR(100), `PackageNoteAlert` BIT, `IsManager` BIT, `CheckedOn` DATE, `EmploymentFrom` DATE, `idDivision` VARCHAR(100), `CheckedBy` VARCHAR(100), `PackageNote` VARCHAR(100), `IsDefaultRole` BIT, `NoteAlert` BIT, `IsKeyContact` BIT, `CompanyNameOnly` VARCHAR(100), `idPerson` VARCHAR(100), `EmploymentAssistant` VARCHAR(100), `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `IsActiveEmployment` BIT, `RowTimestamp` TIMESTAMP, `idRemuneration` VARCHAR(100), `DivisionNameOnly` VARCHAR(100), `IsRegistered` BIT, `idAlias` VARCHAR(100), `Note` TEXT, `SortOrder` VARCHAR(100), `idEmploymentType` VARCHAR(100), `LocalPackage` VARCHAR(100), `CreatedBy` VARCHAR(100), `idCurrency` VARCHAR(100), `SalaryYear` VARCHAR(100), `ModifiedOn` TIMESTAMP);


DROP TABLE IF EXISTS test_csv.AssignmentCandidate;

CREATE TABLE test_csv.AssignmentCandidate (`AdditionalField1` VARCHAR(100), `AdditionalField2` VARCHAR(100), `AssignmentCandidateRank` VARCHAR(100), `ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `HtmlNotes` TEXT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `IsPublished` BIT, `IsWorkflowStarted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `ReplyNumber` VARCHAR(100), `RowTimestamp` TIMESTAMP, `RtfNotes` TEXT, `StatusChangeDate` VARCHAR(100), `StatusChangeReason` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentCandidate` VARCHAR(100), `idAssignmentMedia` VARCHAR(100), `idCandidateOrigin` VARCHAR(100), `idCandidateProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person;

CREATE TABLE test_csv.Person (`Salutation` VARCHAR(100), `idLockCode` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `IsPrivateRecord` VARCHAR(100), `Initials` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `ContactSubject` TEXT, `DateOfBirth` DATE, `LastAttachmentDate` DATE, `BiographyAlert` BIT, `OriginalTrainingAlert` BIT, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `OriginOfData` VARCHAR(100), `idImport` VARCHAR(100), `OriginalTraining` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `ProcessingStatusBy` VARCHAR(100), `PersonImage` VARCHAR(100), `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `IsOffLimit` BIT, `idProcessingReason` VARCHAR(100), `PersonReference` VARCHAR(100), `idProcessingStatus` VARCHAR(100), `AlertTextAlert` BIT, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `NoteAlert` BIT, `ComplianceStartDate` VARCHAR(100), `RtfBiography` TEXT, `ProcessingStatusOn` VARCHAR(100), `idPerson` VARCHAR(100), `RtfNote` TEXT, `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idTitle` VARCHAR(100), `RtfPersonComment` TEXT, `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `AutoUpdateBiography` BIT, `FirstName` VARCHAR(100), `PersonCommentAlert` BIT, `idMaritalStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `idGender` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `FullName` VARCHAR(100), `PrivateMarkedBy` VARCHAR(100), `PersonId` VARCHAR(100), `CreatedBy` VARCHAR(100), `LockExpiresOn` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idUser` VARCHAR(100), `PrivateMarkedOn` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idMarkForDeletion` VARCHAR(100), `AgencyCandidateId` VARCHAR(100), `MaidenName` VARCHAR(100), `idPerson_Eaddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLog;

CREATE TABLE test_csv.ActivityLog (`ActivityLogComment` TEXT, `ActivityType` VARCHAR(100), `Comment` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `InOut` BIT, `IsActive` BIT, `IsBulkLog` BIT, `IsDone` BIT, `IsExcluded` VARCHAR(100), `LandmarkDate` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ProgressId` VARCHAR(100), `ProgressTableName` VARCHAR(100), `ProgressValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `RtfDescription` VARCHAR(100), `ShowTaskIfInactive` BIT, `Subject` TEXT, `Template` VARCHAR(100), `idActivityLog` VARCHAR(100), `idActivityLogContactType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idWorkflowRun` VARCHAR(100), `idWorkflowRunDetail` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogEntity;

CREATE TABLE test_csv.ActivityLogEntity (`AddressUsed` VARCHAR(100), `ContextCompanyName` VARCHAR(100), `ContextEntityId` VARCHAR(100), `ContextEntityNumber` VARCHAR(100), `ContextEntityReference` VARCHAR(100), `ContextEntityTitle` VARCHAR(100), `ContextEntityType` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PersonRoleInActivity` VARCHAR(100), `RowTimestamp` TIMESTAMP, `WriteToCompanyName` VARCHAR(100), `idActivityLog` VARCHAR(100), `idActivityLogEntity` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany1` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonX;

CREATE TABLE test_csv.PersonX (`idPersonStatus_String` VARCHAR(100), `AddressPrivateCity` VARCHAR(100), `Salutation` VARCHAR(100), `idCompany` VARCHAR(100), `PersonComment` TEXT, `MiddleName` VARCHAR(100), `idJobFunction_String_List_BeforePrevious` TEXT, `AddressPrivate2PostCode` VARCHAR(100), `Initials` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `AddressPrivate2Country` VARCHAR(100), `idCountry3` VARCHAR(100), `DateOfBirth` DATE, `PhoneOther` VARCHAR(100), `JobTitle` VARCHAR(100), `Department` VARCHAR(100), `Package` VARCHAR(100), `AddressPrivate2City` VARCHAR(100), `idMarkForDeletion_String` VARCHAR(100), `LastAttachmentDate` DATE, `ComplianceEndDate` VARCHAR(100), `OffLimitUntil` DATE, `URLPrivate2` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `AddressOtherCountyState` VARCHAR(100), `OriginOfData` VARCHAR(100), `JobNotes` TEXT, `idRelocateLocation_String_List` TEXT, `idRelocate_String` VARCHAR(100), `AddressPrivateCountry` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `KeyContact` BIT, `DefaultPhone` VARCHAR(100), `OwningUser` VARCHAR(100), `DefaultURL` TEXT, `AddressDefaultFull` TEXT, `ProcessingReasonValue_String` VARCHAR(100), `Salary` VARCHAR(100), `OriginalTraining` VARCHAR(100), `idPersonOrigin_String` VARCHAR(100), `idPreferredEmploymentType_String` VARCHAR(100), `idLanguage_String_List_Current` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsDateOfBirthEstimated` BIT, `idProcessingReason_String` VARCHAR(100), `AddressOtherCity` VARCHAR(100), `DirectLinePhone` VARCHAR(100), `ProcessingStatusBy` VARCHAR(100), `FaxBusiness` VARCHAR(100), `idIndustry_String_List_BeforePrevious` TEXT, `URLPrivate` TEXT, `LastIntelligenceDate` VARCHAR(100), `Biography` TEXT, `idJobFunction_String_List` TEXT, `AddressOtherCountry` VARCHAR(100), `IsOffLimit` BIT, `MinimumRequiredRate` VARCHAR(100), `PreviousJobTitle` VARCHAR(100), `idLanguage_String_List` VARCHAR(100), `AddressOtherFull` VARCHAR(100), `URLOther` VARCHAR(100), `idLanguage_String_List_Previous` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `idPersonCommunicationType4` VARCHAR(100), `idPersonCommunicationType2` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ProcessingStatusValue_String` VARCHAR(100), `PersonReference` VARCHAR(100), `idQualification_String_List_Current` VARCHAR(100), `idProcessingStatus_String` VARCHAR(100), `idQualification_String_List` TEXT, `idCountry1` VARCHAR(100), `Default_Write_to` BIT, `AlertTextAlert` BIT, `idInternational_String_List_Current` VARCHAR(100), `PreviousCompanyToDate` DATE, `OverallStatusAgencyCandidateId` VARCHAR(100), `AlertText` VARCHAR(100), `ContactedOn` DATE, `ComplianceStartDate` VARCHAR(100), `Division` VARCHAR(100), `idPreviousCandidate_String` VARCHAR(100), `idQualification_String_List_BeforePrevious` VARCHAR(100), `AddressPrivate2CountyState` VARCHAR(100), `ProcessingStatusOn` VARCHAR(100), `idIndustry_String_List_Current` TEXT, `idPerson` VARCHAR(100), `FaxPrivate` VARCHAR(100), `idInternational_String_List` TEXT, `idUnitType_String` VARCHAR(100), `DefaultMobile` VARCHAR(100), `idCandidateGT` VARCHAR(100), `SignOff` VARCHAR(100), `idGender_String` VARCHAR(100), `MobilePrivate` VARCHAR(100), `isPrivateRecord` BIT, `FromDate` DATE, `AssociationRecordString` TEXT, `CreatedOn` TIMESTAMP, `idPerson1` VARCHAR(100), `EmailOther` VARCHAR(100), `idContractorUnavailableReason_String` VARCHAR(100), `FaxOther` VARCHAR(100), `QualificationValue_String` VARCHAR(100), `DefaultFax` VARCHAR(100), `PreviousCompany` VARCHAR(100), `idPersonCommunicationType5` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `idLanguage_String_List_BeforePrevious` VARCHAR(100), `KnownAs` VARCHAR(100), `Suffix` VARCHAR(100), `ProcessingReasonLog` VARCHAR(100), `PhoneHome2` VARCHAR(100), `AddressPrivateFull` TEXT, `idUser_String_List` TEXT, `ToDate` DATE, `LanguageValue_String` VARCHAR(100), `PhoneHome` VARCHAR(100), `FirstName` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `idMaritalStatus_String` VARCHAR(100), `DefaultEmail` VARCHAR(100), `idTitle_String` VARCHAR(100), `ProcessingReasonOn` VARCHAR(100), `idInternational_String_List_BeforePrevious` VARCHAR(100), `idPersonX` VARCHAR(100), `InternationalValue_String` VARCHAR(100), `AddressPrivate2Full` VARCHAR(100), `ProcessingReasonBy` VARCHAR(100), `Note` TEXT, `LastName` VARCHAR(100), `EmailPrivate` VARCHAR(100), `idTeam_String` VARCHAR(100), `idAssignment` VARCHAR(100), `Family` VARCHAR(100), `idPersonCommunicationType3` VARCHAR(100), `MarketRate` VARCHAR(100), `idInternational_String_List_Previous` VARCHAR(100), `JobFunctionValue_String` VARCHAR(100), `idIndustry_String_List_Previous` TEXT, `FullName` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `HardCopyCv` VARCHAR(100), `idJobFunction_String_List_Previous` TEXT, `NationalityValue_String` VARCHAR(100), `PersonId` VARCHAR(100), `idLocation_String` VARCHAR(100), `idPerson_EAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `AddressDefaultPostCode` VARCHAR(100), `AddressPrivatePostCode` VARCHAR(100), `idTeam` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `AddressOtherPostCode` VARCHAR(100), `IdUser_Associate_String` VARCHAR(100), `IsComplete` BIT, `EmailPrivate2` VARCHAR(100), `idQualification_String_List_Previous` VARCHAR(100), `idUser` VARCHAR(100), `idPersonRating_String` VARCHAR(100), `MobilePrivate2` VARCHAR(100), `ModifiedOn` TIMESTAMP, `MobileOther` VARCHAR(100), `idNationality_String_List` VARCHAR(100), `RelocateLocation_String_List` VARCHAR(100), `idJobFunction_String_List_Current` TEXT, `AgencyCandidateId` VARCHAR(100), `EmailWork` VARCHAR(100), `PreviousDivision` VARCHAR(100), `MaidenName` VARCHAR(100), `MobileBusiness` VARCHAR(100), `idCompany1` VARCHAR(100), `BusinessPager` VARCHAR(100), `AddressPrivateCountyState` VARCHAR(100), `idPersonCommunicationType1` VARCHAR(100), `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListMember;

CREATE TABLE test_csv.ListMember (`FoundInAlias` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `IsViewed` BIT, `PointerId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idListHeader` VARCHAR(100), `idListMember` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorExt;

CREATE TABLE test_csv.ContractorExt (`RowTimestamp` TIMESTAMP, `idContractor` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTarget;

CREATE TABLE test_csv.AssignmentTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Rank` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` DATE, `RowTimestamp` TIMESTAMP, `TargetNote` TEXT, `TargetNoteAlert` BIT, `idAssignment` VARCHAR(100), `idAssignmentTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonExt;

CREATE TABLE test_csv.PersonExt (`RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `udField1` VARCHAR(100), `udField2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAssociate;

CREATE TABLE test_csv.PersonAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Document;

CREATE TABLE test_csv.Document (`Attachment` VARCHAR(100), `CheckedOutBy` VARCHAR(100), `CheckedOutOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` VARCHAR(100), `DocumentModifiedBy` VARCHAR(100), `DocumentModifiedOn` TIMESTAMP, `DocumentType` VARCHAR(100), `FilePath` VARCHAR(100), `IsOpenAsEdit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `NewDocumentName` VARCHAR(100), `OriginalDocumentName` TEXT, `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateExt;

CREATE TABLE test_csv.AssignmentCandidateExt (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EAddress;

CREATE TABLE test_csv.EAddress (`CommValue` TEXT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PersonExt;

CREATE TABLE test_csv.Company_PersonExt (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentLandmark;

CREATE TABLE test_csv.AssignmentLandmark (`ActualDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsLandmarkInvoiced` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_EAddress;

CREATE TABLE test_csv.Person_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100), `idPerson_EAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company;

CREATE TABLE test_csv.Company (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `PreferredSupplierAlert` BIT, `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `LastAttachmentDate` DATE, `OffLimitUntil` VARCHAR(100), `CompanyReference` VARCHAR(100), `ParentId` VARCHAR(100), `idLocation` VARCHAR(100), `idImport` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `idCompanyOrigin` VARCHAR(100), `ResearchedBy` VARCHAR(100), `LastIntelligenceDate` DATE, `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `ClientRelationshipNotesAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `RtfNote` TEXT, `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `RtfCompanyComment` TEXT, `CreatedOn` TIMESTAMP, `idAlertFlag` VARCHAR(100), `RevenueConversionRate` BIT, `RowTimestamp` TIMESTAMP, `RtfCompanyNote` TEXT, `Revenue` VARCHAR(100), `CompanyName` VARCHAR(100), `idCompanyStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `RtfClientRelationshipNotes` TEXT, `idCompanyRating` VARCHAR(100), `PreferredSupplier` TEXT, `CreatedBy` VARCHAR(100), `ResearchedOn` DATE, `idTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `CompanyComment` TEXT);


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Contractor;

CREATE TABLE test_csv.Contractor (`idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `MarketRateConversionRate` VARCHAR(100), `ContractorPaymentComment` VARCHAR(100), `ContractorAccountName` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100), `ContractorBankName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ContractorCompanyAddress` VARCHAR(100), `ContractorBranch` VARCHAR(100), `ContractorAvailabilityCommentAlert` BIT, `idUnitType` VARCHAR(100), `ContractorAvailabilityComment` VARCHAR(100), `MinimumRequiredRate` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ContractorAccountNumber` VARCHAR(100), `MinimumRequiredRateConversionRate` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RateInformationOn` VARCHAR(100), `BaseMinimumRequiredRate` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContractorNINumber` VARCHAR(100), `BaseMarketRate` VARCHAR(100), `ContractorPayrollNumber` VARCHAR(100), `ContractorCompanyName` VARCHAR(100), `ContractorCompanyRegistrationNumber` VARCHAR(100), `MarketRate` VARCHAR(100), `ContractorPaymentCommentAlert` BIT, `CreatedBy` VARCHAR(100), `idContractor` VARCHAR(100), `ContractorSortCode` VARCHAR(100), `idCurrency` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ContractorTaxCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Candidate;

CREATE TABLE test_csv.Candidate (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `HardCopyCv` VARCHAR(100), `IsComplete` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idAlertFlag` VARCHAR(100), `idCandidate` VARCHAR(100), `idLocation` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOrigin` VARCHAR(100), `idPersonRating` VARCHAR(100), `idPersonStatus` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100), `idPreviousCandidate` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonExt;

CREATE TABLE test_csv.PersonExt (`RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `udField1` VARCHAR(100), `udField2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListMember;

CREATE TABLE test_csv.ListMember (`FoundInAlias` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `IsViewed` BIT, `PointerId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idListHeader` VARCHAR(100), `idListMember` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAssociate;

CREATE TABLE test_csv.PersonAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorExt;

CREATE TABLE test_csv.ContractorExt (`RowTimestamp` TIMESTAMP, `idContractor` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListMember;

CREATE TABLE test_csv.ListMember (`FoundInAlias` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `IsViewed` BIT, `PointerId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idListHeader` VARCHAR(100), `idListMember` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonExt;

CREATE TABLE test_csv.PersonExt (`RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `udField1` VARCHAR(100), `udField2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTarget;

CREATE TABLE test_csv.AssignmentTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Rank` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` DATE, `RowTimestamp` TIMESTAMP, `TargetNote` TEXT, `TargetNoteAlert` BIT, `idAssignment` VARCHAR(100), `idAssignmentTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateExt;

CREATE TABLE test_csv.AssignmentCandidateExt (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAssociate;

CREATE TABLE test_csv.PersonAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PersonExt;

CREATE TABLE test_csv.Company_PersonExt (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentLandmark;

CREATE TABLE test_csv.AssignmentLandmark (`ActualDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsLandmarkInvoiced` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Document;

CREATE TABLE test_csv.Document (`Attachment` VARCHAR(100), `CheckedOutBy` VARCHAR(100), `CheckedOutOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` VARCHAR(100), `DocumentModifiedBy` VARCHAR(100), `DocumentModifiedOn` TIMESTAMP, `DocumentType` VARCHAR(100), `FilePath` VARCHAR(100), `IsOpenAsEdit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `NewDocumentName` VARCHAR(100), `OriginalDocumentName` TEXT, `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EAddress;

CREATE TABLE test_csv.EAddress (`CommValue` TEXT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_EAddress;

CREATE TABLE test_csv.Person_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100), `idPerson_EAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company;

CREATE TABLE test_csv.Company (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `PreferredSupplierAlert` BIT, `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `LastAttachmentDate` DATE, `OffLimitUntil` VARCHAR(100), `CompanyReference` VARCHAR(100), `ParentId` VARCHAR(100), `idLocation` VARCHAR(100), `idImport` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `idCompanyOrigin` VARCHAR(100), `ResearchedBy` VARCHAR(100), `LastIntelligenceDate` DATE, `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `ClientRelationshipNotesAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `RtfNote` TEXT, `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `RtfCompanyComment` TEXT, `CreatedOn` TIMESTAMP, `idAlertFlag` VARCHAR(100), `RevenueConversionRate` BIT, `RowTimestamp` TIMESTAMP, `RtfCompanyNote` TEXT, `Revenue` VARCHAR(100), `CompanyName` VARCHAR(100), `idCompanyStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `RtfClientRelationshipNotes` TEXT, `idCompanyRating` VARCHAR(100), `PreferredSupplier` TEXT, `CreatedBy` VARCHAR(100), `ResearchedOn` DATE, `idTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `CompanyComment` TEXT);


DROP TABLE IF EXISTS test_csv.Candidate;

CREATE TABLE test_csv.Candidate (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `HardCopyCv` VARCHAR(100), `IsComplete` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idAlertFlag` VARCHAR(100), `idCandidate` VARCHAR(100), `idLocation` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOrigin` VARCHAR(100), `idPersonRating` VARCHAR(100), `idPersonStatus` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100), `idPreviousCandidate` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Contractor;

CREATE TABLE test_csv.Contractor (`idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `MarketRateConversionRate` VARCHAR(100), `ContractorPaymentComment` VARCHAR(100), `ContractorAccountName` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100), `ContractorBankName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ContractorCompanyAddress` VARCHAR(100), `ContractorBranch` VARCHAR(100), `ContractorAvailabilityCommentAlert` BIT, `idUnitType` VARCHAR(100), `ContractorAvailabilityComment` VARCHAR(100), `MinimumRequiredRate` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ContractorAccountNumber` VARCHAR(100), `MinimumRequiredRateConversionRate` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RateInformationOn` VARCHAR(100), `BaseMinimumRequiredRate` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContractorNINumber` VARCHAR(100), `BaseMarketRate` VARCHAR(100), `ContractorPayrollNumber` VARCHAR(100), `ContractorCompanyName` VARCHAR(100), `ContractorCompanyRegistrationNumber` VARCHAR(100), `MarketRate` VARCHAR(100), `ContractorPaymentCommentAlert` BIT, `CreatedBy` VARCHAR(100), `idContractor` VARCHAR(100), `ContractorSortCode` VARCHAR(100), `idCurrency` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ContractorTaxCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCode_Company_Person;

CREATE TABLE test_csv.PersonCode_Company_Person (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100), `idPersonCode` VARCHAR(100), `idPersonCode_Company_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCode;

CREATE TABLE test_csv.PersonCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTarget;

CREATE TABLE test_csv.AssignmentTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Rank` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` DATE, `RowTimestamp` TIMESTAMP, `TargetNote` TEXT, `TargetNoteAlert` BIT, `idAssignment` VARCHAR(100), `idAssignmentTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAssociate;

CREATE TABLE test_csv.PersonAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListMember;

CREATE TABLE test_csv.ListMember (`FoundInAlias` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `IsViewed` BIT, `PointerId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idListHeader` VARCHAR(100), `idListMember` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorExt;

CREATE TABLE test_csv.ContractorExt (`RowTimestamp` TIMESTAMP, `idContractor` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonExt;

CREATE TABLE test_csv.PersonExt (`RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `udField1` VARCHAR(100), `udField2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateExt;

CREATE TABLE test_csv.AssignmentCandidateExt (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PersonExt;

CREATE TABLE test_csv.Company_PersonExt (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EAddress;

CREATE TABLE test_csv.EAddress (`CommValue` TEXT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentLandmark;

CREATE TABLE test_csv.AssignmentLandmark (`ActualDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsLandmarkInvoiced` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Document;

CREATE TABLE test_csv.Document (`Attachment` VARCHAR(100), `CheckedOutBy` VARCHAR(100), `CheckedOutOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` VARCHAR(100), `DocumentModifiedBy` VARCHAR(100), `DocumentModifiedOn` TIMESTAMP, `DocumentType` VARCHAR(100), `FilePath` VARCHAR(100), `IsOpenAsEdit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `NewDocumentName` VARCHAR(100), `OriginalDocumentName` TEXT, `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company;

CREATE TABLE test_csv.Company (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `PreferredSupplierAlert` BIT, `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `LastAttachmentDate` DATE, `OffLimitUntil` VARCHAR(100), `CompanyReference` VARCHAR(100), `ParentId` VARCHAR(100), `idLocation` VARCHAR(100), `idImport` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `idCompanyOrigin` VARCHAR(100), `ResearchedBy` VARCHAR(100), `LastIntelligenceDate` DATE, `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `ClientRelationshipNotesAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `RtfNote` TEXT, `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `RtfCompanyComment` TEXT, `CreatedOn` TIMESTAMP, `idAlertFlag` VARCHAR(100), `RevenueConversionRate` BIT, `RowTimestamp` TIMESTAMP, `RtfCompanyNote` TEXT, `Revenue` VARCHAR(100), `CompanyName` VARCHAR(100), `idCompanyStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `RtfClientRelationshipNotes` TEXT, `idCompanyRating` VARCHAR(100), `PreferredSupplier` TEXT, `CreatedBy` VARCHAR(100), `ResearchedOn` DATE, `idTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `CompanyComment` TEXT);


DROP TABLE IF EXISTS test_csv.Person_EAddress;

CREATE TABLE test_csv.Person_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100), `idPerson_EAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Candidate;

CREATE TABLE test_csv.Candidate (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `HardCopyCv` VARCHAR(100), `IsComplete` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idAlertFlag` VARCHAR(100), `idCandidate` VARCHAR(100), `idLocation` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOrigin` VARCHAR(100), `idPersonRating` VARCHAR(100), `idPersonStatus` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100), `idPreviousCandidate` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Contractor;

CREATE TABLE test_csv.Contractor (`idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `MarketRateConversionRate` VARCHAR(100), `ContractorPaymentComment` VARCHAR(100), `ContractorAccountName` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100), `ContractorBankName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ContractorCompanyAddress` VARCHAR(100), `ContractorBranch` VARCHAR(100), `ContractorAvailabilityCommentAlert` BIT, `idUnitType` VARCHAR(100), `ContractorAvailabilityComment` VARCHAR(100), `MinimumRequiredRate` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ContractorAccountNumber` VARCHAR(100), `MinimumRequiredRateConversionRate` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RateInformationOn` VARCHAR(100), `BaseMinimumRequiredRate` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContractorNINumber` VARCHAR(100), `BaseMarketRate` VARCHAR(100), `ContractorPayrollNumber` VARCHAR(100), `ContractorCompanyName` VARCHAR(100), `ContractorCompanyRegistrationNumber` VARCHAR(100), `MarketRate` VARCHAR(100), `ContractorPaymentCommentAlert` BIT, `CreatedBy` VARCHAR(100), `idContractor` VARCHAR(100), `ContractorSortCode` VARCHAR(100), `idCurrency` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ContractorTaxCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCode_Company_Person;

CREATE TABLE test_csv.PersonCode_Company_Person (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100), `idPersonCode` VARCHAR(100), `idPersonCode_Company_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCode;

CREATE TABLE test_csv.PersonCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AttributeFilterTypeEnum;

CREATE TABLE test_csv.AttributeFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idAttributeFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStage;

CREATE TABLE test_csv.AssignmentStage (`ActualDate` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EstimatedCandidateCount` VARCHAR(100), `IsStageInOutlook` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idAssignmentStage` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentShowAs;

CREATE TABLE test_csv.AppointmentShowAs (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShowAsKey` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAppointmentShowAs` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorUnavailableReason;

CREATE TABLE test_csv.ContractorUnavailableReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteDescription;

CREATE TABLE test_csv.CreditNoteDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTaskTemplate;

CREATE TABLE test_csv.AssignmentTaskTemplate (`Area` VARCHAR(100), `Description` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentTaskTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemComment;

CREATE TABLE test_csv.CreditNoteItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentType;

CREATE TABLE test_csv.AssignmentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ConsultantFeeDescription;

CREATE TABLE test_csv.ConsultantFeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idConsultantFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactColourCategory;

CREATE TABLE test_csv.AssignmentContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Division;

CREATE TABLE test_csv.Division (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DivisionName` VARCHAR(100), `DivisionNote` VARCHAR(100), `DivisionNoteAlert` BIT, `IsDeleted` BIT, `IsOffLimit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitUntil` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CountyState;

CREATE TABLE test_csv.CountyState (`Abbreviation` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100), `idCountyState` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentType;

CREATE TABLE test_csv.DocumentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceProgress;

CREATE TABLE test_csv.AssignmentSourceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InfoBoxType;

CREATE TABLE test_csv.InfoBoxType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInfoBoxType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceEntity;

CREATE TABLE test_csv.IntelligenceEntity (`EntityId` VARCHAR(100), `EntityName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceEntity` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderStatus;

CREATE TABLE test_csv.ListHeaderStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idListHeaderStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TrackingActivity;

CREATE TABLE test_csv.TrackingActivity (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTrackingActivity` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AliasReason;

CREATE TABLE test_csv.AliasReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAliasReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OutputDefinitionParameter;

CREATE TABLE test_csv.OutputDefinitionParameter (`Caption` VARCHAR(100), `DefaultValue` VARCHAR(100), `IsRequired` BIT, `LookupTableName` VARCHAR(100), `ParameterName` VARCHAR(100), `ParameterType` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idOutputDefinition` VARCHAR(100), `idOutputDefinitionParameter` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreviousCandidate;

CREATE TABLE test_csv.PreviousCandidate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreviousCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RemunerationBenefit;

CREATE TABLE test_csv.RemunerationBenefit (`BenefitNote` VARCHAR(100), `BenefitValue` VARCHAR(100), `IsSet` BIT, `RowTimestamp` TIMESTAMP, `idBenefit` VARCHAR(100), `idRemuneration` VARCHAR(100), `idRemunerationBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeaderType;

CREATE TABLE test_csv.ListHeaderType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idListHeaderType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Relocate;

CREATE TABLE test_csv.Relocate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationUnit;

CREATE TABLE test_csv.OrganizationUnit (`BillToAddress` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DeliveryAddress` VARCHAR(100), `DepartmentName` VARCHAR(100), `DisabledReason` VARCHAR(100), `FtpSiteUrl` VARCHAR(100), `FullOrganizationUnitCode` BIT, `IsDisabled` BIT, `IsForKPI` VARCHAR(100), `IsGdprRestricted` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OrganizationUnitCode` BIT, `OrganizationUnitDescription` VARCHAR(100), `OrganizationUnitEMail` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `OrganizationUnitPhoneMain` VARCHAR(100), `OrganizationUnitPhoneOther` VARCHAR(100), `ParentId` VARCHAR(100), `ParentOrganizationUnitCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UtcOffsetDisplayName` VARCHAR(100), `UtcOffsetStandardName` VARCHAR(100), `WebSiteUrl` VARCHAR(100), `idOrganizationUnit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRating;

CREATE TABLE test_csv.PersonRating (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRating` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceDescription;

CREATE TABLE test_csv.InvoiceDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Gender;

CREATE TABLE test_csv.Gender (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idGender` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReferenceProgress;

CREATE TABLE test_csv.PersonReferenceProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MaritalStatus;

CREATE TABLE test_csv.MaritalStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMaritalStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentOrigin;

CREATE TABLE test_csv.AssignmentOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAddressType;

CREATE TABLE test_csv.CompanyAddressType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentApplicationStatusWeb;

CREATE TABLE test_csv.AssignmentApplicationStatusWeb (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentApplicationStatusWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.tableMDshort;

CREATE TABLE test_csv.tableMDshort (`Caption` VARCHAR(100), `TableName` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractStatus;

CREATE TABLE test_csv.ContractStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ScheduleTask;

CREATE TABLE test_csv.ScheduleTask (`CreatedBy` VARCHAR(100), `CreatedOn` VARCHAR(100), `IsEnable` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Parameters` TEXT, `RowTimestamp` VARCHAR(100), `ScheduleError` VARCHAR(100), `ScheduleNo` VARCHAR(100), `Task` VARCHAR(100), `TaskName` VARCHAR(100), `TaskType` VARCHAR(100), `idScheduleTask` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.QuickImportSettings;

CREATE TABLE test_csv.QuickImportSettings (`ClientId` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsAddEducation` BIT, `IsAddSkill` BIT, `IsAddWorkHistory` BIT, `IsCreateCompanyForWorkRecord` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idDocumentType` VARCHAR(100), `idQuickImportSettings` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentColourCategory;

CREATE TABLE test_csv.AssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PasswordHistoryAspNet;

CREATE TABLE test_csv.PasswordHistoryAspNet (`CreatedDate` TIMESTAMP, `LastPasswordChangedDate` TIMESTAMP, `Password` VARCHAR(100), `PasswordFormat` BIT, `PasswordSalt` VARCHAR(100), `RowTimestamp` TIMESTAMP, `UserId` VARCHAR(100), `idPasswordHistoryAspNet` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionAssociate;

CREATE TABLE test_csv.IntroductionAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SalaryRangeWeb;

CREATE TABLE test_csv.SalaryRangeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSalaryRangeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionStatus;

CREATE TABLE test_csv.IntroductionStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContactStatus;

CREATE TABLE test_csv.CampaignContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteType;

CREATE TABLE test_csv.CreditNoteType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyStatus;

CREATE TABLE test_csv.CompanyStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOrigin;

CREATE TABLE test_csv.PersonOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateOrigin;

CREATE TABLE test_csv.CandidateOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCandidateOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunctionWeb;

CREATE TABLE test_csv.JobFunctionWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunctionWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexSourceColourCategory;

CREATE TABLE test_csv.FlexSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonColourCategory;

CREATE TABLE test_csv.PersonColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ColourCategory;

CREATE TABLE test_csv.ColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalSettings;

CREATE TABLE test_csv.ClientPortalSettings (`OriginalCSS` TEXT, `OriginalPageLayoutModel` TEXT, `OriginalPortalSettingsJSON` TEXT, `PageLayoutModel` VARCHAR(100), `PortalSettingsJSON` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SectionVisibility` VARCHAR(100), `UpdatedCSSOnly` VARCHAR(100), `idClientPortalSettings` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexAssignmentColourCategory;

CREATE TABLE test_csv.FlexAssignmentColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexAssignmentColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LandmarkTemplate;

CREATE TABLE test_csv.LandmarkTemplate (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `IsTemplateDefault` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignType;

CREATE TABLE test_csv.CampaignType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idCampaignType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractType;

CREATE TABLE test_csv.ContractType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idContractType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Alias;

CREATE TABLE test_csv.Alias (`AliasName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaxRate;

CREATE TABLE test_csv.TaxRate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RateValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idTaxRate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceType;

CREATE TABLE test_csv.InvoiceType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ImageCategory;

CREATE TABLE test_csv.ImageCategory (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idImageCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStrategy;

CREATE TABLE test_csv.AssignmentStrategy (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStrategy` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOrigin;

CREATE TABLE test_csv.CompanyOrigin (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyOrigin` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Benefit;

CREATE TABLE test_csv.Benefit (`BenefitDescription` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idBenefit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionColourCategory;

CREATE TABLE test_csv.IntroductionColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemComment;

CREATE TABLE test_csv.InvoiceItemComment (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemComment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonReference;

CREATE TABLE test_csv.PersonReference (`CheckedBy` VARCHAR(100), `CheckedOn` DATE, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idPersonReference` VARCHAR(100), `idPersonReferenceProgress` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MediaWeb;

CREATE TABLE test_csv.MediaWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMediaWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Person;

CREATE TABLE test_csv.Introduction_Person (`ContactSubject` VARCHAR(100), `ContactedBy` VARCHAR(100), `ContactedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100), `idIntroduction_Person` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactRole;

CREATE TABLE test_csv.AssignmentContactRole (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.InvoiceItemType;

CREATE TABLE test_csv.InvoiceItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInvoiceItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CreditNoteItemType;

CREATE TABLE test_csv.CreditNoteItemType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCreditNoteItemType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Currency;

CREATE TABLE test_csv.Currency (`ConversionRate` BIT, `CurrencyName` VARCHAR(100), `CurrencySymbol` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCurrency` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmploymentType;

CREATE TABLE test_csv.EmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.RateDescription;

CREATE TABLE test_csv.RateDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idRateDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntelligenceCode;

CREATE TABLE test_csv.IntelligenceCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligenceCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IndustryWeb;

CREATE TABLE test_csv.IndustryWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustryWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Media;

CREATE TABLE test_csv.Media (`Address` VARCHAR(100), `Contact` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `Phone` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idMedia` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FeeDescription;

CREATE TABLE test_csv.FeeDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFeeDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LogViewTypeEnum;

CREATE TABLE test_csv.LogViewTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLogViewTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udCompanyOtherCode;

CREATE TABLE test_csv.udCompanyOtherCode (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudCompanyOtherCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OffLimitType;

CREATE TABLE test_csv.OffLimitType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignStatus;

CREATE TABLE test_csv.CampaignStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelationType;

CREATE TABLE test_csv.PersonRelationType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ClientPortalLanguage;

CREATE TABLE test_csv.ClientPortalLanguage (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idClientPortalLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.MarkForDeletion;

CREATE TABLE test_csv.MarkForDeletion (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idMarkForDeletion` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexType;

CREATE TABLE test_csv.FlexType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionContactStatus;

CREATE TABLE test_csv.IntroductionContactStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionContactStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionExt;

CREATE TABLE test_csv.IntroductionExt (`RowTimestamp` TIMESTAMP, `idIntroduction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Title;

CREATE TABLE test_csv.Title (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTitle` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Division;

CREATE TABLE test_csv.Company_Division (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompany_Division` VARCHAR(100), `idDivision` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.IntroductionProgress;

CREATE TABLE test_csv.IntroductionProgress (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAddressType;

CREATE TABLE test_csv.PersonAddressType (`IsActive` BIT, `IsDefault` BIT, `IsGdprRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idPersonAddressType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskStatus;

CREATE TABLE test_csv.TaskStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookStatus` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Organization;

CREATE TABLE test_csv.Organization (`WFProperties` VARCHAR(100), `CompanyPrefix` VARCHAR(100), `AssignmentSuffix` VARCHAR(100), `CompanyNumber` VARCHAR(100), `InvoiceSuffix` VARCHAR(100), `IntroductionDelimiter2` VARCHAR(100), `idReferenceSuffixType05` VARCHAR(100), `InvoiceIncrement` BIT, `AssignmentDelimiter1` VARCHAR(100), `idReferenceSuffixType04` VARCHAR(100), `idReferenceSuffixType6` VARCHAR(100), `idReferenceSuffixType` VARCHAR(100), `PersonDelimiter2` VARCHAR(100), `TrackingPrefix` VARCHAR(100), `IntroductionNumber` VARCHAR(100), `FlexAssignmentIncrement` VARCHAR(100), `OrganizationShortName` VARCHAR(100), `AssignmentDelimiter2` VARCHAR(100), `idReferenceSuffixType2` VARCHAR(100), `ContractDelimiter2` VARCHAR(100), `ContractPrefix` VARCHAR(100), `AssignmentNumber` BIT, `idReferenceSuffixType07` VARCHAR(100), `ContractDelimiter1` VARCHAR(100), `ModifiedBy` VARCHAR(100), `InvoiceDelimiter2` VARCHAR(100), `OrganizationName` VARCHAR(100), `idReferenceSuffixType01` VARCHAR(100), `IsIntroductionRefFreeText` VARCHAR(100), `IsFlexAssignmentRefFreeText` VARCHAR(100), `ReferenceSuffixType7` VARCHAR(100), `CompanyDelimiter2` VARCHAR(100), `ContractSuffix` VARCHAR(100), `idReferenceSuffixType7` VARCHAR(100), `idReferenceSuffixType5` VARCHAR(100), `CampaignPrefix` VARCHAR(100), `idReferenceSuffixType00` VARCHAR(100), `FlexAssignmentNumber` VARCHAR(100), `idReferenceSuffixType3` VARCHAR(100), `idReferenceSuffixType02` VARCHAR(100), `InvoicePrefix` VARCHAR(100), `IsContractRefFreeText` VARCHAR(100), `CampaignDelimiter2` VARCHAR(100), `CompanyIncrement` VARCHAR(100), `idReferenceSuffixType06` VARCHAR(100), `IntroductionPrefix` VARCHAR(100), `CompanyDelimiter1` VARCHAR(100), `IsCampaignRefFreeText` VARCHAR(100), `IsAssignmentRefFreeText` VARCHAR(100), `PersonSuffix` VARCHAR(100), `MaxTrackingId` VARCHAR(100), `TrackingId` VARCHAR(100), `PersonPrefix` VARCHAR(100), `IntroductionDelimiter1` VARCHAR(100), `CreatedOn` TIMESTAMP, `BaseTrackingId` VARCHAR(100), `idOrganization` VARCHAR(100), `idReferenceSuffixType4` VARCHAR(100), `AssignmentPrefix` VARCHAR(100), `RowTimestamp` TIMESTAMP, `IntroductionIncrement` VARCHAR(100), `IsPersonRefFreeText` VARCHAR(100), `ContractIncrement` VARCHAR(100), `idReferenceSuffixType03` VARCHAR(100), `InvoiceDelimiter1` VARCHAR(100), `FlexAssignmentDelimiter1` VARCHAR(100), `ContractNumber` VARCHAR(100), `CampaignSuffix` VARCHAR(100), `idReferenceSuffixType1` VARCHAR(100), `CampaignIncrement` VARCHAR(100), `PersonDelimiter1` VARCHAR(100), `PersonNumber` VARCHAR(100), `CampaignNumber` VARCHAR(100), `IsInvoiceRefFreeText` VARCHAR(100), `FlexAssignmentDelimiter2` VARCHAR(100), `CreatedBy` VARCHAR(100), `FlexAssignmentPrefix` VARCHAR(100), `IsCompanyRefFreeText` VARCHAR(100), `PersonIncrement` VARCHAR(100), `FlexAssignmentSuffix` VARCHAR(100), `ModifiedOn` TIMESTAMP, `IntroductionSuffix` VARCHAR(100), `InvoiceNumber` BIT, `AssignmentIncrement` BIT, `CompanySuffix` VARCHAR(100), `CampaignDelimiter1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Qualification;

CREATE TABLE test_csv.Qualification (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingReason;

CREATE TABLE test_csv.ProcessingReason (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MonthsToExpire` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ServerStatus;

CREATE TABLE test_csv.ServerStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idServerStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobTypeWeb;

CREATE TABLE test_csv.JobTypeWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobTypeWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PreferredEmploymentType;

CREATE TABLE test_csv.PreferredEmploymentType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AlertFlag;

CREATE TABLE test_csv.AlertFlag (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAlertFlag` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DocumentDescription;

CREATE TABLE test_csv.DocumentDescription (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskPriority;

CREATE TABLE test_csv.TaskPriority (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `OutLookPriority` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idTaskPriority` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyColourCategory;

CREATE TABLE test_csv.CompanyColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCompanyColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence_User;

CREATE TABLE test_csv.Intelligence_User (`IsRead` BIT, `RowTimestamp` TIMESTAMP, `idIntelligence` VARCHAR(100), `idIntelligence_User` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSourceColourCategory;

CREATE TABLE test_csv.AssignmentSourceColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentSourceColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexContactColourCategory;

CREATE TABLE test_csv.FlexContactColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexContactColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonStatus;

CREATE TABLE test_csv.PersonStatus (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idPersonStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.SkillWeb;

CREATE TABLE test_csv.SkillWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idSkillWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.OrganizationFilterTypeEnum;

CREATE TABLE test_csv.OrganizationFilterTypeEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` BIT, `Value` VARCHAR(100), `idOrganizationFilterTypeEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCommunicationType;

CREATE TABLE test_csv.CompanyCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Language;

CREATE TABLE test_csv.Language (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLanguage` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignColourCategory;

CREATE TABLE test_csv.CampaignColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCampaignColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.FlexCandidateColourCategory;

CREATE TABLE test_csv.FlexCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idFlexCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_Alias;

CREATE TABLE test_csv.Company_Alias (`AliasNote` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idAlias` VARCHAR(100), `idAliasReason` VARCHAR(100), `idCompany` VARCHAR(100), `idCompany_Alias` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Mru;

CREATE TABLE test_csv.Mru (`ClientId` VARCHAR(100), `Context` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IconName` VARCHAR(100), `IsOpened` BIT, `IsPinned` BIT, `ItemCaption` VARCHAR(100), `ItemDescription` VARCHAR(100), `LastAccessDateTime` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Module` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SourceType` VARCHAR(100), `UserId` VARCHAR(100), `idEntity` VARCHAR(100), `idMru` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ProcessingStatus;

CREATE TABLE test_csv.ProcessingStatus (`GTStatus` VARCHAR(100), `IsActive` BIT, `IsAvailableForManual` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idProcessingReason` VARCHAR(100), `idProcessingStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateColourCategory;

CREATE TABLE test_csv.AssignmentCandidateColourCategory (`ColourName` VARCHAR(100), `ColourValue` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentCandidateColourCategory` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogContactType;

CREATE TABLE test_csv.ActivityLogContactType (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `MvcArea` VARCHAR(100), `ParentId` VARCHAR(100), `PersonActivityType` VARCHAR(100), `Perspective` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogContactType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ActivityLogType;

CREATE TABLE test_csv.ActivityLogType (`AllowMultiplePersons` BIT, `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idActivityLogType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill1;

CREATE TABLE test_csv.udSkill1 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill1` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignAssociate;

CREATE TABLE test_csv.CampaignAssociate (`Association` VARCHAR(100), `CampaignAssociation` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.International;

CREATE TABLE test_csv.International (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idInternational` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.udSkill2;

CREATE TABLE test_csv.udSkill2 (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idudSkill2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ReminderIntervalEnum;

CREATE TABLE test_csv.ReminderIntervalEnum (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idReminderIntervalEnum` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.DuplicationRuleConfiguration;

CREATE TABLE test_csv.DuplicationRuleConfiguration (`DefaultScore` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `Score` VARCHAR(100), `SortOrder` BIT, `Value` VARCHAR(100), `idDuplicationRuleConfiguration` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocationWeb;

CREATE TABLE test_csv.LocationWeb (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocationWeb` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentStatus;

CREATE TABLE test_csv.AssignmentStatus (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsEndStatus` BIT, `IsForKPI` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction_Company;

CREATE TABLE test_csv.Introduction_Company (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `FindType` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `Priority` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idIntroduction` VARCHAR(100), `idIntroduction_Company` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidate_PersonRelation;

CREATE TABLE test_csv.AssignmentCandidate_PersonRelation (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidate_PersonRelation` VARCHAR(100), `idPersonRelation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.StageTemplate;

CREATE TABLE test_csv.StageTemplate (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idStageTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Intelligence;

CREATE TABLE test_csv.Intelligence (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Informer` VARCHAR(100), `IntelligenceComment` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `Subject` VARCHAR(100), `idIntelligence` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idPerson` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.TaskLog;

CREATE TABLE test_csv.TaskLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idTask` VARCHAR(100), `idTaskLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Introduction;

CREATE TABLE test_csv.Introduction (`IntroductionCommentAlert` BIT, `idOrganizationUnit` VARCHAR(100), `ContactSubject` VARCHAR(100), `CompanyQueryCondition` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `Comment` VARCHAR(100), `CompletedOn` VARCHAR(100), `StartedOn` DATE, `ModifiedBy` VARCHAR(100), `BaseFee` VARCHAR(100), `idIntroduction` VARCHAR(100), `Severance` VARCHAR(100), `IntroductionReference` VARCHAR(100), `LinkedOn` VARCHAR(100), `FeeConversionRate` VARCHAR(100), `FeeNoteAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `ContactedOn` DATE, `IntroductionComment` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `ContactedBy` VARCHAR(100), `FeeNote` VARCHAR(100), `Fee` VARCHAR(100), `CommentAlert` BIT, `Title` VARCHAR(100), `IntroductionNo` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `idIntroductionProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignExt;

CREATE TABLE test_csv.CampaignExt (`RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.LocalizationTextCP;

CREATE TABLE test_csv.LocalizationTextCP (`ContextDescription` VARCHAR(100), `Language` VARCHAR(100), `LocalizationKey` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ValueText` TEXT, `idLocalizationTextCP` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyOffLimit;

CREATE TABLE test_csv.CompanyOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` VARCHAR(100), `OffLimitDateTo` VARCHAR(100), `OffLimitNote` VARCHAR(100), `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyOffLimit` VARCHAR(100), `idOffLimitType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCommunicationType;

CREATE TABLE test_csv.PersonCommunicationType (`IsActive` BIT, `IsDefault` BIT, `IsFixed` BIT, `IsGDPRRestricted` BIT, `IsProtected` BIT, `IsReadOnly` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `ValidationExpression` VARCHAR(100), `Value` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Nationality;

CREATE TABLE test_csv.Nationality (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idNationality` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CandidateProgress;

CREATE TABLE test_csv.CandidateProgress (`EnumKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsForKPI` VARCHAR(100), `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idAssignmentStatus` VARCHAR(100), `idCandidateProgress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Campaign;

CREATE TABLE test_csv.Campaign (`idCurrency1` VARCHAR(100), `CampaignBudget` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `FinalCost` VARCHAR(100), `LastAttachmentDate` VARCHAR(100), `isComplianceCampaign` BIT, `CampaignTitle` VARCHAR(100), `BaseCampaignBudget` VARCHAR(100), `FinalCostConversionRate` VARCHAR(100), `ModifiedBy` VARCHAR(100), `IsNewBusiness` BIT, `BaseFinalCost` VARCHAR(100), `ApproximateNoOfTargets` BIT, `CampaignValue` VARCHAR(100), `CampaignDescription` TEXT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `idCampaign` VARCHAR(100), `CampaignBudgetConversionRate` VARCHAR(100), `idCampaignType` VARCHAR(100), `CreatedOn` TIMESTAMP, `CampaignValueConversionrate` VARCHAR(100), `RtfCampaignDescription` TEXT, `idCampaignStatus` VARCHAR(100), `LastContactSearchParameters` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ComplianceStatistic` VARCHAR(100), `CampaignNo` VARCHAR(100), `BaseCampaignValue` VARCHAR(100), `BatchStatus` VARCHAR(100), `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `IsDeleted` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `LastTargetSearchParameters` VARCHAR(100), `CampaignReference` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.JobFunction;

CREATE TABLE test_csv.JobFunction (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idJobFunction` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Location;

CREATE TABLE test_csv.Location (`IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idLocation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Country;

CREATE TABLE test_csv.Country (`Abbreviation` VARCHAR(100), `AddressFormat` TEXT, `AddressLayoutKey` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idCountry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Industry;

CREATE TABLE test_csv.Industry (`Code` VARCHAR(100), `IsActive` BIT, `IsDefault` BIT, `IsProtected` BIT, `ItemType` VARCHAR(100), `ParentId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `SearchTerm` VARCHAR(100), `SortOrder` VARCHAR(100), `Value` VARCHAR(100), `idIndustry` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignTarget;

CREATE TABLE test_csv.CampaignTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonNameVariation;

CREATE TABLE test_csv.PersonNameVariation (`AlternativeName` VARCHAR(100), `PersonName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPersonNameVariation` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AppointmentLog;

CREATE TABLE test_csv.AppointmentLog (`RowTimestamp` TIMESTAMP, `idActivityLog` VARCHAR(100), `idAppointment` VARCHAR(100), `idAppointmentLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Education;

CREATE TABLE test_csv.Education (`CheckedBy` VARCHAR(100), `CheckedOn` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `EducationEstablishment` VARCHAR(100), `EducationFrom` DATE, `EducationSubject` VARCHAR(100), `EducationTo` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idEducation` VARCHAR(100), `idPerson` VARCHAR(100), `idQualification` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListHeader;

CREATE TABLE test_csv.ListHeader (`ColorCategory` TEXT, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ExpiryDate` VARCHAR(100), `IsActive` BIT, `IsFavourite` BIT, `IsTemporary` BIT, `LastExecutedOn` VARCHAR(100), `ListHeaderDescription` VARCHAR(100), `ListHeaderModel` VARCHAR(100), `ListHeaderModuleName` VARCHAR(100), `ListHeaderQuery` TEXT, `ListName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ResultFields` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idListHeader` VARCHAR(100), `idListHeaderStatus` VARCHAR(100), `idListHeaderType` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `idTeam` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContactExt;

CREATE TABLE test_csv.AssignmentContactExt (`RowTimestamp` TIMESTAMP, `idAssignmentContact` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonRelation;

CREATE TABLE test_csv.PersonRelation (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `IsConfidential` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RelationDescription` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPerson1` VARCHAR(100), `idPersonRelation` VARCHAR(100), `idPersonRelationType` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Task;

CREATE TABLE test_csv.Task (`CompletedDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `DueDate` DATE, `EntityId` TEXT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `PercentComplete` VARCHAR(100), `RecurrenceInfo` VARCHAR(100), `ReminderInfo` VARCHAR(100), `RowTimestamp` TIMESTAMP, `StartDate` DATE, `Subject` TEXT, `idTask` VARCHAR(100), `idTaskPriority` VARCHAR(100), `idTaskStatus` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CampaignContact;

CREATE TABLE test_csv.CampaignContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `LastContactedOn` DATE, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idCampaign` VARCHAR(100), `idCampaignContact` VARCHAR(100), `idCampaignContactStatus` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Placement;

CREATE TABLE test_csv.Placement (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlacementDate` DATE, `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idCompany_Person` VARCHAR(100), `idPlacement` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentExt;

CREATE TABLE test_csv.AssignmentExt (`RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCode;

CREATE TABLE test_csv.AssignmentCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentAssociate;

CREATE TABLE test_csv.AssignmentAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Appointment;

CREATE TABLE test_csv.Appointment (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` TEXT, `EndDate` TIMESTAMP, `EntityId` TEXT, `IsAllDay` BIT, `Label` BIT, `Location` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OutlookEntryId` TEXT, `RecurrenceInfo` VARCHAR(100), `ReminderInfo` TEXT, `RowTimestamp` TIMESTAMP, `StartDate` TIMESTAMP, `Status` VARCHAR(100), `Subject` TEXT, `Type` BIT, `idAppointment` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentBI;

CREATE TABLE test_csv.AssignmentBI (`CompleteDay` DATE, `Consultant` VARCHAR(100), `DaysOpen` VARCHAR(100), `DaysToshortlist` VARCHAR(100), `Fee` BIT, `InterviewDate` VARCHAR(100), `InterviewToOffer` VARCHAR(100), `NoOfInterviews` VARCHAR(100), `NoOfOffers` VARCHAR(100), `NoOfOffersPerPlace` VARCHAR(100), `NoOfPlaces` VARCHAR(100), `NoOfShortlistedActual` VARCHAR(100), `NoOfShortlistedTarget` VARCHAR(100), `OrganizationUnitName` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ShortListDate` VARCHAR(100), `StartDay` DATE, `TimeToFill` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentBI` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentContact;

CREATE TABLE test_csv.AssignmentContact (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsGuestAssignmentContact` BIT, `IsMatchedInSearch` BIT, `IsPrincipalContact` BIT, `IsPublished` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` VARCHAR(100), `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentContact` VARCHAR(100), `idAssignmentContactRole` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonOffLimit;

CREATE TABLE test_csv.PersonOffLimit (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsActive` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `OffLimitBy` VARCHAR(100), `OffLimitDateFrom` DATE, `OffLimitDateTo` DATE, `OffLimitNote` TEXT, `OffLimitNoteAlert` BIT, `RowTimestamp` TIMESTAMP, `idOffLimitType` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOffLimit` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateCode;

CREATE TABLE test_csv.AssignmentCandidateCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100), `idAssignmentCandidateCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EmailLog;

CREATE TABLE test_csv.EmailLog (`BccRecipients` VARCHAR(100), `CcRecipients` VARCHAR(100), `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `DrRequired` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `RrRequired` VARCHAR(100), `Sender` VARCHAR(100), `SubmittedBy` VARCHAR(100), `Template` VARCHAR(100), `ToRecipients` VARCHAR(100), `TrackingToken` VARCHAR(100), `idActivityLog` VARCHAR(100), `idEmailLog` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_PAddress;

CREATE TABLE test_csv.Person_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idPAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonAddressType` VARCHAR(100), `idPerson_PAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Postcode;

CREATE TABLE test_csv.Postcode (`EastDistance` VARCHAR(100), `Latitude` VARCHAR(100), `Longitude` VARCHAR(100), `NorthDistance` VARCHAR(100), `PostcodeValue` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPostcode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PAddress;

CREATE TABLE test_csv.Company_PAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `idCompany_PAddress` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PAddress;

CREATE TABLE test_csv.PAddress (`AddressLine1` TEXT, `AddressLine2` VARCHAR(100), `AddressLine3` VARCHAR(100), `AddressLine4` VARCHAR(100), `City` VARCHAR(100), `CountyState` VARCHAR(100), `FullAddress` TEXT, `OldAddress` TEXT, `OldPostCode` VARCHAR(100), `PostCode` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCountry` VARCHAR(100), `idPAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentSource;

CREATE TABLE test_csv.AssignmentSource (`ContactSubject` TEXT, `ContactedBy` VARCHAR(100), `ContactedOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Notes` TEXT, `NotesAlert` BIT, `RowTimestamp` TIMESTAMP, `idAssignment` VARCHAR(100), `idAssignmentSource` VARCHAR(100), `idAssignmentSourceProgress` VARCHAR(100), `idPerson` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyExt;

CREATE TABLE test_csv.CompanyExt (`RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyCode;

CREATE TABLE test_csv.CompanyCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCode` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Assignment;

CREATE TABLE test_csv.Assignment (`AdditionalInformationAlert` BIT, `idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `LocalSalaryFrom` VARCHAR(100), `AssignmentCommentAlert` BIT, `AssignmentComment` TEXT, `EstimatedValueConversionRate` BIT, `idAssignmentStrategy` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `PitchDate` VARCHAR(100), `StatusChangeReason` TEXT, `BaseSalaryTo` VARCHAR(100), `AgeFrom` VARCHAR(100), `FeeComment` TEXT, `LastAttachmentDate` DATE, `DecisionDate` VARCHAR(100), `NoCandidatesReplied` VARCHAR(100), `IsConfidential` BIT, `AssignmentType` VARCHAR(100), `ShortDescription` VARCHAR(100), `AdditionalContactInformation` VARCHAR(100), `LongDescriptionAlert` BIT, `PackageComment` TEXT, `AssignmentPortalSetting` VARCHAR(100), `ModifiedBy` VARCHAR(100), `SuccessProbability` BIT, `ShortDescriptionAlert` BIT, `idDivision` VARCHAR(100), `FinalFee` VARCHAR(100), `SalaryTo` VARCHAR(100), `DisplayTo` VARCHAR(100), `AdditionalContactInformationAlert` BIT, `IsPublished` BIT, `ActualCompleteDate` DATE, `AlertTextAlert` BIT, `BaseEstimatedFee` VARCHAR(100), `AlertText` TEXT, `ContactInformation` VARCHAR(100), `ContactInformationAlert` BIT, `EstimatedFee` VARCHAR(100), `DisplayFrom` VARCHAR(100), `ContactName` VARCHAR(100), `ConfirmedBy` VARCHAR(100), `BaseSalaryFrom` VARCHAR(100), `CreatedOn` TIMESTAMP, `idAssignmentOrigin` VARCHAR(100), `ActualStartDate` DATE, `RowTimestamp` TIMESTAMP, `EstimatedValue` VARCHAR(100), `EstimatedFeeConversionRate` BIT, `AgeTo` VARCHAR(100), `LastContactedOn` DATE, `StatusChangeDate` DATE, `AdditionalInformation` VARCHAR(100), `LegacyGuid` VARCHAR(100), `SearchParameter` TEXT, `FinalFeeConversionRate` BIT, `idAssignmentSector` VARCHAR(100), `AssignmentNo` VARCHAR(100), `SalaryFrom` VARCHAR(100), `SalaryToConversionRate` BIT, `idAssignmentWorkflowProcessType` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentType` VARCHAR(100), `IsSearchParameterProtected` BIT, `EstimatedCompleteDate` DATE, `AssignmentBrief` TEXT, `CreatedBy` VARCHAR(100), `idTeam` VARCHAR(100), `RtfBrief` TEXT, `IsDeleted` BIT, `idAssignmentStatus` VARCHAR(100), `SalaryFromConversionRate` BIT, `idCurrency` VARCHAR(100), `idCurrency2` VARCHAR(100), `LongDescription` VARCHAR(100), `PackageCommentAlert` BIT, `idUser` VARCHAR(100), `EstimatedStartDate` DATE, `LocalSalaryTo` VARCHAR(100), `AssignmentReference` VARCHAR(100), `FeeCommentAlert` BIT, `ModifiedOn` TIMESTAMP, `DocumentToPublish` VARCHAR(100), `AssignmentTitle` VARCHAR(100), `BaseEstimatedValue` VARCHAR(100), `BaseFinalFee` VARCHAR(100), `Url` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EntityDocument;

CREATE TABLE test_csv.EntityDocument (`EntityId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idEntityDocument` VARCHAR(100), `idTableMD` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyAssociate;

CREATE TABLE test_csv.CompanyAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_EAddress;

CREATE TABLE test_csv.Company_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idCompany` VARCHAR(100), `idCompanyCommunicationType` VARCHAR(100), `idCompany_EAddress` VARCHAR(100), `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ContractorExt;

CREATE TABLE test_csv.ContractorExt (`RowTimestamp` TIMESTAMP, `idContractor` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonExt;

CREATE TABLE test_csv.PersonExt (`RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `udField1` VARCHAR(100), `udField2` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentCandidateExt;

CREATE TABLE test_csv.AssignmentCandidateExt (`RowTimestamp` TIMESTAMP, `idAssignmentCandidate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.ListMember;

CREATE TABLE test_csv.ListMember (`FoundInAlias` BIT, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `IsViewed` BIT, `PointerId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idListHeader` VARCHAR(100), `idListMember` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentTarget;

CREATE TABLE test_csv.AssignmentTarget (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsExcluded` BIT, `IsMatchedInSearch` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `Rank` VARCHAR(100), `ResearchedBy` VARCHAR(100), `ResearchedOn` DATE, `RowTimestamp` TIMESTAMP, `TargetNote` TEXT, `TargetNoteAlert` BIT, `idAssignment` VARCHAR(100), `idAssignmentTarget` VARCHAR(100), `idCompany` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonAssociate;

CREATE TABLE test_csv.PersonAssociate (`Association` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonAssociate` VARCHAR(100), `idUser` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.AssignmentLandmark;

CREATE TABLE test_csv.AssignmentLandmark (`ActualDate` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `IsLandmarkInvoiced` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `PlannedDate` DATE, `RowTimestamp` TIMESTAMP, `SortOrder` VARCHAR(100), `idAssignment` VARCHAR(100), `idAssignmentLandmark` VARCHAR(100), `idLandmarkTemplate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company_PersonExt;

CREATE TABLE test_csv.Company_PersonExt (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.EAddress;

CREATE TABLE test_csv.EAddress (`CommValue` TEXT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Document;

CREATE TABLE test_csv.Document (`Attachment` VARCHAR(100), `CheckedOutBy` VARCHAR(100), `CheckedOutOn` DATE, `CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `Description` VARCHAR(100), `DocumentModifiedBy` VARCHAR(100), `DocumentModifiedOn` TIMESTAMP, `DocumentType` VARCHAR(100), `FilePath` VARCHAR(100), `IsOpenAsEdit` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `NewDocumentName` VARCHAR(100), `OriginalDocumentName` TEXT, `RowTimestamp` TIMESTAMP, `idDocument` VARCHAR(100), `idDocumentDescription` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Person_EAddress;

CREATE TABLE test_csv.Person_EAddress (`IsDefault` BIT, `RowTimestamp` TIMESTAMP, `idEAddress` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonCommunicationType` VARCHAR(100), `idPerson_EAddress` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Company;

CREATE TABLE test_csv.Company (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `PreferredSupplierAlert` BIT, `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `LastAttachmentDate` DATE, `OffLimitUntil` VARCHAR(100), `CompanyReference` VARCHAR(100), `ParentId` VARCHAR(100), `idLocation` VARCHAR(100), `idImport` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `idCompanyOrigin` VARCHAR(100), `ResearchedBy` VARCHAR(100), `LastIntelligenceDate` DATE, `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `ClientRelationshipNotesAlert` BIT, `AlertTextAlert` BIT, `AlertText` VARCHAR(100), `RtfNote` TEXT, `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `RtfCompanyComment` TEXT, `CreatedOn` TIMESTAMP, `idAlertFlag` VARCHAR(100), `RevenueConversionRate` BIT, `RowTimestamp` TIMESTAMP, `RtfCompanyNote` TEXT, `Revenue` VARCHAR(100), `CompanyName` VARCHAR(100), `idCompanyStatus` VARCHAR(100), `LegacyGuid` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `RtfClientRelationshipNotes` TEXT, `idCompanyRating` VARCHAR(100), `PreferredSupplier` TEXT, `CreatedBy` VARCHAR(100), `ResearchedOn` DATE, `idTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `CompanyComment` TEXT);


DROP TABLE IF EXISTS test_csv.Candidate;

CREATE TABLE test_csv.Candidate (`CreatedBy` VARCHAR(100), `CreatedOn` TIMESTAMP, `HardCopyCv` VARCHAR(100), `IsComplete` BIT, `ModifiedBy` VARCHAR(100), `ModifiedOn` TIMESTAMP, `RowTimestamp` TIMESTAMP, `idAlertFlag` VARCHAR(100), `idCandidate` VARCHAR(100), `idLocation` VARCHAR(100), `idPerson` VARCHAR(100), `idPersonOrigin` VARCHAR(100), `idPersonRating` VARCHAR(100), `idPersonStatus` VARCHAR(100), `idPreferredEmploymentType` VARCHAR(100), `idPreviousCandidate` VARCHAR(100), `idRelocate` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.CompanyX;

CREATE TABLE test_csv.CompanyX (`BaseRevenue` VARCHAR(100), `CompanyNoteAlert` BIT, `idCompany` VARCHAR(100), `CompanyURL2` VARCHAR(100), `OwningOrganization` VARCHAR(100), `idOrganizationUnit` VARCHAR(100), `Branch` VARCHAR(100), `CompanyURLOther` VARCHAR(100), `LastAttachmentDate` DATE, `idCompanyStatus_String` VARCHAR(100), `OffLimitUntil` VARCHAR(100), `idOrganizationUnit_String` VARCHAR(100), `idCompanyCommunicationType4` VARCHAR(100), `CompanyReference` VARCHAR(100), `idCompanyOrigin_String` VARCHAR(100), `AddressPostalCountyState` VARCHAR(100), `ParentId` VARCHAR(100), `idUser_String` VARCHAR(100), `idCountry2` VARCHAR(100), `DefaultPhone` VARCHAR(100), `AddressPostalPostCode` VARCHAR(100), `OwningUser` VARCHAR(100), `AddressDefaultFull` TEXT, `CompanyFax2` VARCHAR(100), `GroupId` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ResearchedBy` VARCHAR(100), `idCompanyCommunicationType1` VARCHAR(100), `CompanyEmail2` VARCHAR(100), `IsOffLimit` BIT, `NoOfEmployees` VARCHAR(100), `idAlertFlag_String` VARCHAR(100), `IsTopOfGroup` BIT, `CompanyId` VARCHAR(100), `AddressDefaultIdCountry_String` VARCHAR(100), `AddressInvoiceFull` VARCHAR(100), `GroupName` VARCHAR(100), `idCountry1` VARCHAR(100), `AlertTextAlert` BIT, `AddressInvoicePostCode` VARCHAR(100), `AlertText` VARCHAR(100), `AddressInvoiceCity` VARCHAR(100), `CompanySwitchboard` VARCHAR(100), `CompanyFaxOther` VARCHAR(100), `IdCompanyX` VARCHAR(100), `idUser1` VARCHAR(100), `Ranking` VARCHAR(100), `CompanyPhoneOther` VARCHAR(100), `AssociationRecordString` VARCHAR(100), `CreatedOn` TIMESTAMP, `idCompanyRating_String` VARCHAR(100), `idCompanyCommunicationType3` VARCHAR(100), `idUser_Associate_String` VARCHAR(100), `AddressPostalCountry` VARCHAR(100), `DefaultFax` VARCHAR(100), `idCompanyCommunicationType2` VARCHAR(100), `CompanyURL1` VARCHAR(100), `RowTimestamp` TIMESTAMP, `CompanyEmail1` VARCHAR(100), `CompanyEmailOther` VARCHAR(100), `idUser_String_List` VARCHAR(100), `DefaultUrl` VARCHAR(100), `Revenue` VARCHAR(100), `CompanyPhone2` VARCHAR(100), `CompanyName` VARCHAR(100), `AddressDefaultCity` VARCHAR(100), `DefaultEmail` VARCHAR(100), `RegistrationNumber` VARCHAR(100), `ClientRelationshipNotes` TEXT, `idTeam_String` VARCHAR(100), `AddressPostalCity` VARCHAR(100), `idCompanyAddressType` VARCHAR(100), `AddressDefaultCountyState` VARCHAR(100), `PreferredSupplier` TEXT, `AddressInvoiceCountyState` VARCHAR(100), `idLocation_String` VARCHAR(100), `CreatedBy` VARCHAR(100), `idIndustry_String_List` TEXT, `ResearchedOn` DATE, `AddressDefaultPostCode` VARCHAR(100), `idTeam` VARCHAR(100), `OwningTeam` VARCHAR(100), `IsDeleted` BIT, `CompanyNote` TEXT, `idCurrency` VARCHAR(100), `idUser` VARCHAR(100), `CompanyFax1` VARCHAR(100), `AddressPostalFull` TEXT, `ModifiedOn` TIMESTAMP, `CompanyCommentAlert` BIT, `AddressInvoiceCountry` VARCHAR(100), `CompanyComment` TEXT, `IndustryValue_String` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.Contractor;

CREATE TABLE test_csv.Contractor (`idCurrency1` VARCHAR(100), `idCompany` VARCHAR(100), `MarketRateConversionRate` VARCHAR(100), `ContractorPaymentComment` VARCHAR(100), `ContractorAccountName` VARCHAR(100), `idContractorUnavailableReason` VARCHAR(100), `ContractorBankName` VARCHAR(100), `ModifiedBy` VARCHAR(100), `ContractorCompanyAddress` VARCHAR(100), `ContractorBranch` VARCHAR(100), `ContractorAvailabilityCommentAlert` BIT, `idUnitType` VARCHAR(100), `ContractorAvailabilityComment` VARCHAR(100), `MinimumRequiredRate` VARCHAR(100), `NextAvailableOn` VARCHAR(100), `ContractorAccountNumber` VARCHAR(100), `MinimumRequiredRateConversionRate` VARCHAR(100), `idPerson` VARCHAR(100), `CreatedOn` TIMESTAMP, `RateInformationOn` VARCHAR(100), `BaseMinimumRequiredRate` VARCHAR(100), `RowTimestamp` TIMESTAMP, `ContractorNINumber` VARCHAR(100), `BaseMarketRate` VARCHAR(100), `ContractorPayrollNumber` VARCHAR(100), `ContractorCompanyName` VARCHAR(100), `ContractorCompanyRegistrationNumber` VARCHAR(100), `MarketRate` VARCHAR(100), `ContractorPaymentCommentAlert` BIT, `CreatedBy` VARCHAR(100), `idContractor` VARCHAR(100), `ContractorSortCode` VARCHAR(100), `idCurrency` VARCHAR(100), `ModifiedOn` TIMESTAMP, `ContractorTaxCode` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCode_Company_Person;

CREATE TABLE test_csv.PersonCode_Company_Person (`RowTimestamp` TIMESTAMP, `idCompany_Person` VARCHAR(100), `idPersonCode` VARCHAR(100), `idPersonCode_Company_Person` VARCHAR(100));


DROP TABLE IF EXISTS test_csv.PersonCode;

CREATE TABLE test_csv.PersonCode (`CodeId` VARCHAR(100), `RowTimestamp` TIMESTAMP, `idPerson` VARCHAR(100), `idPersonCode` VARCHAR(100), `idTableMD` VARCHAR(100));

