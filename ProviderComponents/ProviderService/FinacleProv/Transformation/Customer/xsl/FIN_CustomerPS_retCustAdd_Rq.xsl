<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"
                xmlns:ns3="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Customer/V1/CustomerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="FIXML" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <FIXML xmlns="http://www.finacle.com/fixml">
      <Header>
        <RequestHeader>
          <MessageKey>
            <RequestUUID>
              <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
            </RequestUUID>
            <ServiceRequestId>RetCustAdd</ServiceRequestId>
            <ServiceRequestVersion>10.2</ServiceRequestVersion>
            <ChannelId>
              <xsl:value-of select="/eo:ESBMsg/com:Source"/>
            </ChannelId>
          </MessageKey>
          <RequestMessageInfo>
            <BankId>54</BankId>
            <TimeZone></TimeZone>
            <EntityId></EntityId>
            <EntityType></EntityType>
            <MessageDateTime>2014-09-11T11:09:51.000</MessageDateTime>
          </RequestMessageInfo>
          <Security>
            <Token>
              <PasswordToken>
                <UserId></UserId>
                <Password></Password>
              </PasswordToken>
            </Token>
            <FICertToken></FICertToken>
            <RealUserLoginSessionId></RealUserLoginSessionId>
            <RealUser></RealUser>
            <RealUserPwd></RealUserPwd>
            <SSOTransferToken></SSOTransferToken>
          </Security>
        </RequestHeader>
      </Header>
      <Body>
        <RetCustAddRequest>
          <RetCustAddRq>
            <CustDtls>
              <CustData>
                <AcctName>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:PersonName/com:FullName"/>
                </AcctName>
                <AddrDtls>
                  <AddrLine1>
                    <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Address/com:LineOne"/>
                  </AddrLine1>
                  <AddrLine2/>
                  <AddrLine3/>
                  <AddrCategory>
                    <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Address/com:AddressType"/>
                  </AddrCategory>
                  <City>
                    <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Address/com:CityName"/>
                  </City>
                  <Country>
                    <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Address/com:CountryName"/>
                  </Country>
                  <FreeTextLabel>Email address</FreeTextLabel>
                  <xsl:choose>
                    <xsl:when test='/eo:ESBMsg/eo:RqData/eo:Customer/com:Address/com:PreferredIndicator = "true"'>
                      <PrefAddr>Y</PrefAddr>
                    </xsl:when>
                    <xsl:otherwise>
                      <PrefAddr>N</PrefAddr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <PrefFormat>FREE_TEXT_FORMAT</PrefFormat>
                  <StartDt>1999-09-01T00:00:00.000</StartDt>
                  <State>
                    <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Address/com:StateName"/>
                  </State>
                  <PostalCode>
                    <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Address/com:PostalCode"/>
                  </PostalCode>
                </AddrDtls>
                <BirthDt>
                  <xsl:value-of select='substring-after (substring-after (/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:BirthDate, "-" ), "-" )'/>
                </BirthDt>
                <BirthMonth>
                  <xsl:value-of select='substring-before (substring-after (/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:BirthDate, "-" ), "-" )'/>
                </BirthMonth>
                <BirthYear>
                  <xsl:value-of select='substring-before (/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:BirthDate, "-" )'/>
                </BirthYear>
                <CustType>Retail</CustType>
                <CreatedBySystemId>COR</CreatedBySystemId>
                <DateOfBirth>
                  <xsl:value-of select='concat (/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:BirthDate, "T00:00:00.000" )'/>
                </DateOfBirth>
                <Language>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:Language"/>
                </Language>
                <LastName>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:PersonName/com:LastName"/>
                </LastName>
                <MiddleName>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:PersonName/com:MiddleName"/>
                </MiddleName>
                <FirstName>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:PersonName/com:FirstName"/>
                </FirstName>
                <IsMinor>N</IsMinor>
                <IsCustNRE>N</IsCustNRE>
                <DefaultAddrType>Mailing</DefaultAddrType>
                <Gender>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:GenderCode"/>
                </Gender>
                <Manager>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:RelationshipManagerName"/>
                </Manager>
                <NativeLanguageCode>INFENG</NativeLanguageCode>
                <Occupation>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:Employment/com:Occupation"/>
                </Occupation>
                <xsl:for-each select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Phone">
                  <PhoneEmailDtls>
                    <PhoneEmailType>
                      <xsl:value-of select="com:PhoneType"/>
                    </PhoneEmailType>
                    <xsl:choose>
                      <xsl:when test="com:CompleteNumber">
                        <PhoneNumCityCode>
                          <xsl:value-of select='substring (com:CompleteNumber, 4,3 )'/>
                        </PhoneNumCityCode>
                        <PhoneNumCountryCode>
                          <xsl:value-of select='substring (com:CompleteNumber, 1,3 )'/>
                        </PhoneNumCountryCode>
                        <PhoneNumLocalCode>
                          <xsl:value-of select='substring (com:CompleteNumber, 7 )'/>
                        </PhoneNumLocalCode>
                      </xsl:when>
                      <xsl:otherwise>
                        <PhoneNumCityCode>
                          <xsl:value-of select='com:AreaCode'/>
                        </PhoneNumCityCode>
                        <PhoneNumCountryCode>
                          <xsl:value-of select='com:CountryCode'/>
                        </PhoneNumCountryCode>
                        <PhoneNumLocalCode>
                          <xsl:value-of select='concat(com:LocalNumber/text(),com:ExtensionNumber/text())'/>
                        </PhoneNumLocalCode>
                      </xsl:otherwise>
                    </xsl:choose>
                    <PhoneOrEmail>PHONE</PhoneOrEmail>
                    <xsl:choose>
                      <xsl:when test='com:PreferredIndicator = "true"'>
                        <PrefFlag>Y</PrefFlag>
                      </xsl:when>
                      <xsl:otherwise>
                        <PrefFlag>N</PrefFlag>
                      </xsl:otherwise>
                    </xsl:choose>
                  </PhoneEmailDtls>
                </xsl:for-each>
                <xsl:for-each select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Email">
                  <PhoneEmailDtls>
                    <Email>
                      <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Email/com:EmailAddress"/>
                    </Email>
                    <PhoneEmailType>
                      <xsl:value-of select="com:EmailType"/>
                    </PhoneEmailType>
                    <PhoneOrEmail>EMAIL</PhoneOrEmail>
                    <xsl:choose>
                      <xsl:when test='com:PreferredIndicator = "true"'>
                        <PrefFlag>Y</PrefFlag>
                      </xsl:when>
                      <xsl:otherwise>
                        <PrefFlag>N</PrefFlag>
                      </xsl:otherwise>
                    </xsl:choose>
                  </PhoneEmailDtls>
                </xsl:for-each>
                <PrefName>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:PersonName/com:FirstName"/>
                </PrefName>
                <PrimarySolId>
                  <xsl:value-of select="concat(substring('00',string-length(/eo:ESBMsg/eo:RqData/eo:Customer/com:CustomerIdentifier/com:BranchID/text())),/eo:ESBMsg/eo:RqData/eo:Customer/com:CustomerIdentifier/com:BranchID/text())"/>
                </PrimarySolId>
                <RelationshipOpeningDt>2014-09-11T11:09:51.000</RelationshipOpeningDt>
                <Salutation>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:PersonName/com:Title"/>
                </Salutation>
                <SegmentationClass>MICRO</SegmentationClass>
                <ShortName>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:PersonName/com:FirstName"/>
                </ShortName>
                <StaffFlag>N</StaffFlag>
                <SubSegment>MICRB</SubSegment>
                <TaxDeductionTable>ZERO</TaxDeductionTable>
              </CustData>
            </CustDtls>
            <RelatedDtls>
              <DemographicData>
                <NameOfEmployer>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:Employment/com:CompanyName"/>
                </NameOfEmployer>
                <MaritalStatus>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:MaritalStatus"/>
                </MaritalStatus>
                <Nationality>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:Nationality"/>
                </Nationality>
              </DemographicData>
              <EntityDoctData>
                <CountryOfIssue>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:IdentityDocument/com:IssuingCountry"/>
                </CountryOfIssue>
                <DocCode>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentType"/>
                </DocCode>
                <Desc>NATIONAL I.D</Desc>
                <IssueDt>
                  <xsl:value-of select='concat (/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:IdentityDocument/com:IssueDate, "T00:00:00.000" )'/>
                </IssueDt>
                <TypeCode>INDIV</TypeCode>
                <TypeDesc>IDENTIFICATION PROOF FOR INDIVIDUALS</TypeDesc>
                <PlaceOfIssue>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:IdentityDocument/com:IssuingLocation"/>
                </PlaceOfIssue>
                <ReferenceNum>
                  <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentID"/>
                </ReferenceNum>
                <PrefUniqueId>Y</PrefUniqueId>
              </EntityDoctData>
              <PsychographicData>
                <PsychographMiscData>
                  <StrText10>KES</StrText10>
                  <Type>CURRENCY</Type>
                </PsychographMiscData>
              </PsychographicData>
              <TradeFinData>
                <CustNative></CustNative>
                <InlandTradeAllowed></InlandTradeAllowed>
                <Rmks></Rmks>
                <TradeAuthorityCode></TradeAuthorityCode>
              </TradeFinData>
            </RelatedDtls>
          </RetCustAddRq>
          <RetCustAdd_CustomData>
            <custStatus></custStatus>
            <custCaste></custCaste>
          </RetCustAdd_CustomData>
        </RetCustAddRequest>
      </Body>
    </FIXML>
  </xsl:template>
</xsl:stylesheet>
