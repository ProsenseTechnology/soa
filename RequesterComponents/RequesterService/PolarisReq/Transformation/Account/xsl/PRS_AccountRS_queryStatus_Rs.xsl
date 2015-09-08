<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:rs="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Account/V1"
                xmlns:rcom="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app acceo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Account/V1/AccountRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <rs:ESBMsg>
      <rcom:MsgID>
        <xsl:value-of select="/acceo:ESBMsg/com:MsgID"/>
      </rcom:MsgID>
      <xsl:if test="/acceo:ESBMsg/acceo:RsData">
        <rs:RsData>
          <xsl:if test="/acceo:ESBMsg/acceo:RsData/acceo:Account">
            <xsl:for-each select="/acceo:ESBMsg/acceo:RsData/acceo:Account">
              <rs:Account>
                <xsl:if test="com:AccountIdentifier">
                  <com:AccountIdentifier>
                    <xsl:if test="com:AccountIdentifier/com:BankID">
                      <com:BankID>
                        <xsl:value-of select="com:AccountIdentifier/com:BankID"/>
                      </com:BankID>
                    </xsl:if>
                    <xsl:if test="com:AccountIdentifier/com:BankBIC">
                      <com:BankBIC>
                        <xsl:value-of select="com:AccountIdentifier/com:BankBIC"/>
                      </com:BankBIC>
                    </xsl:if>
                    <xsl:if test="com:AccountIdentifier/com:BranchID">
                      <com:BranchID>
                        <xsl:value-of select="com:AccountIdentifier/com:BranchID"/>
                      </com:BranchID>
                    </xsl:if>
                    <xsl:if test="com:AccountIdentifier/com:AccountID">
                      <com:AccountID>
                        <xsl:value-of select="com:AccountIdentifier/com:AccountID"/>
                      </com:AccountID>
                    </xsl:if>
                    <xsl:if test="com:AccountIdentifier/com:AccountCurrency">
                      <com:AccountCurrency>
                        <xsl:value-of select="com:AccountIdentifier/com:AccountCurrency"/>
                      </com:AccountCurrency>
                    </xsl:if>
                  </com:AccountIdentifier>
                </xsl:if>
                <xsl:if test="acceo:AccountType">
                  <acceo:AccountType>
                    <xsl:value-of select="acceo:AccountType"/>
                  </acceo:AccountType>
                </xsl:if>
                <xsl:if test="acceo:AccountSubType">
                  <acceo:AccountSubType>
                    <xsl:value-of select="acceo:AccountSubType"/>
                  </acceo:AccountSubType>
                </xsl:if>
                <xsl:if test="acceo:AccountOpenDate">
                  <acceo:AccountOpenDate>
                    <xsl:value-of select="acceo:AccountOpenDate"/>
                  </acceo:AccountOpenDate>
                </xsl:if>
                <xsl:if test="acceo:AccountOwnership">
                  <acceo:AccountOwnership>
                    <xsl:value-of select="acceo:AccountOwnership"/>
                  </acceo:AccountOwnership>
                </xsl:if>
                <xsl:if test="acceo:ModeOfOperation">
                  <acceo:ModeOfOperation>
                    <xsl:value-of select="acceo:ModeOfOperation"/>
                  </acceo:ModeOfOperation>
                </xsl:if>
                <xsl:if test="custeo:Customer">
                  <custeo:Customer>
                    <xsl:if test="custeo:Customer/com:CustomerIdentifier">
                      <com:CustomerIdentifier>
                        <xsl:if test="custeo:Customer/com:CustomerIdentifier/com:BankID">
                          <com:BankID>
                            <xsl:value-of select="custeo:Customer/com:CustomerIdentifier/com:BankID"/>
                          </com:BankID>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:CustomerIdentifier/com:CustomerID">
                          <com:CustomerID>
                            <xsl:value-of select="substring (custeo:Customer/com:CustomerIdentifier/com:CustomerID, 3 )"/>
                          </com:CustomerID>
                        </xsl:if>
                      </com:CustomerIdentifier>
                    </xsl:if>
                    <xsl:if test="custeo:Customer/custeo:CustomerType">
                      <custeo:CustomerType>
                        <xsl:value-of select="custeo:Customer/custeo:CustomerType"/>
                      </custeo:CustomerType>
                    </xsl:if>
                    <xsl:if test="custeo:Customer/com:Person">
                      <com:Person>
                        <xsl:if test="custeo:Customer/com:Person/com:PersonName">
                          <com:PersonName>
                            <xsl:if test="custeo:Customer/com:Person/com:PersonName/com:FullName">
                              <com:FullName>
                                <xsl:value-of select="custeo:Customer/com:Person/com:PersonName/com:FullName"/>
                              </com:FullName>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:PersonName/com:FirstName">
                              <com:FirstName>
                                <xsl:value-of select="custeo:Customer/com:Person/com:PersonName/com:FirstName"/>
                              </com:FirstName>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:PersonName/com:MiddleName">
                              <com:MiddleName>
                                <xsl:value-of select="custeo:Customer/com:Person/com:PersonName/com:MiddleName"/>
                              </com:MiddleName>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:PersonName/com:LastName">
                              <com:LastName>
                                <xsl:value-of select="custeo:Customer/com:Person/com:PersonName/com:LastName"/>
                              </com:LastName>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:PersonName/com:Title">
                              <com:Title>
                                <xsl:value-of select="custeo:Customer/com:Person/com:PersonName/com:Title"/>
                              </com:Title>
                            </xsl:if>
                          </com:PersonName>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:BirthDate">
                          <com:BirthDate>
                            <xsl:value-of select="custeo:Customer/com:Person/com:BirthDate"/>
                          </com:BirthDate>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:BirthCountry">
                          <com:BirthCountry>
                            <xsl:value-of select="custeo:Customer/com:Person/com:BirthCountry"/>
                          </com:BirthCountry>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:BirthCityName">
                          <com:BirthCityName>
                            <xsl:value-of select="custeo:Customer/com:Person/com:BirthCityName"/>
                          </com:BirthCityName>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:GenderCode">
                          <com:GenderCode>
                            <xsl:value-of select="custeo:Customer/com:Person/com:GenderCode"/>
                          </com:GenderCode>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:Language">
                          <com:Language>
                            <xsl:value-of select="custeo:Customer/com:Person/com:Language"/>
                          </com:Language>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:NativeLanguage">
                          <com:NativeLanguage>
                            <xsl:value-of select="custeo:Customer/com:Person/com:NativeLanguage"/>
                          </com:NativeLanguage>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:Nationality">
                          <com:Nationality>
                            <xsl:value-of select="custeo:Customer/com:Person/com:Nationality"/>
                          </com:Nationality>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:MaritalStatus">
                          <com:MaritalStatus>
                            <xsl:value-of select="custeo:Customer/com:Person/com:MaritalStatus"/>
                          </com:MaritalStatus>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:MinorIndicator">
                          <com:MinorIndicator>
                            <xsl:value-of select="custeo:Customer/com:Person/com:MinorIndicator"/>
                          </com:MinorIndicator>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:NREIndicator">
                          <com:NREIndicator>
                            <xsl:value-of select="custeo:Customer/com:Person/com:NREIndicator"/>
                          </com:NREIndicator>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:Occupation">
                          <com:Occupation>
                            <xsl:value-of select="custeo:Customer/com:Person/com:Occupation"/>
                          </com:Occupation>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument">
                          <com:IdentityDocument>
                            <com:IdentityDocumentID>
                              <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentID"/>
                            </com:IdentityDocumentID>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentSerialNumber">
                              <com:IdentityDocumentSerialNumber>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentSerialNumber"/>
                              </com:IdentityDocumentSerialNumber>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentType">
                              <com:IdentityDocumentType>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentType"/>
                              </com:IdentityDocumentType>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:IssueDate">
                              <com:IssueDate>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:IssueDate"/>
                              </com:IssueDate>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:ExpirationDate">
                              <com:ExpirationDate>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:ExpirationDate"/>
                              </com:ExpirationDate>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:IssuingCountry">
                              <com:IssuingCountry>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:IssuingCountry"/>
                              </com:IssuingCountry>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:IssuingLocation">
                              <com:IssuingLocation>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:IssuingLocation"/>
                              </com:IssuingLocation>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:IssuingAuthority">
                              <com:IssuingAuthority>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:IssuingAuthority"/>
                              </com:IssuingAuthority>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:DocImage1">
                              <com:DocImage1>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:DocImage1"/>
                              </com:DocImage1>
                            </xsl:if>
                            <xsl:if test="custeo:Customer/com:Person/com:IdentityDocument/com:DocImage2">
                              <com:DocImage2>
                                <xsl:value-of select="custeo:Customer/com:Person/com:IdentityDocument/com:DocImage2"/>
                              </com:DocImage2>
                            </xsl:if>
                          </com:IdentityDocument>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Person/com:SignatureImage">
                          <com:SignatureImage>
                            <xsl:value-of select="custeo:Customer/com:Person/com:SignatureImage"/>
                          </com:SignatureImage>
                        </xsl:if>
                      </com:Person>
                    </xsl:if>
                    <xsl:if test="custeo:Customer/com:Company">
                      <com:Company>
                        <xsl:if test="custeo:Customer/com:Company/com:CompanyName">
                          <com:CompanyName>
                            <xsl:value-of select="custeo:Customer/com:Company/com:CompanyName"/>
                          </com:CompanyName>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Company/com:IncorporationDate">
                          <com:IncorporationDate>
                            <xsl:value-of select="custeo:Customer/com:Company/com:IncorporationDate"/>
                          </com:IncorporationDate>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Company/com:RegistrationCode">
                          <com:RegistrationCode>
                            <xsl:value-of select="custeo:Customer/com:Company/com:RegistrationCode"/>
                          </com:RegistrationCode>
                        </xsl:if>
                      </com:Company>
                    </xsl:if>
                    <xsl:if test="custeo:Customer/com:Address">
                      <com:Address>
                        <xsl:if test="custeo:Customer/com:Address/com:AddressType">
                          <com:AddressType>
                            <xsl:value-of select="custeo:Customer/com:Address/com:AddressType"/>
                          </com:AddressType>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:LineOne">
                          <com:LineOne>
                            <xsl:value-of select="custeo:Customer/com:Address/com:LineOne"/>
                          </com:LineOne>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:LineTwo">
                          <com:LineTwo>
                            <xsl:value-of select="custeo:Customer/com:Address/com:LineTwo"/>
                          </com:LineTwo>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:LineThree">
                          <com:LineThree>
                            <xsl:value-of select="custeo:Customer/com:Address/com:LineThree"/>
                          </com:LineThree>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:LineFour">
                          <com:LineFour>
                            <xsl:value-of select="custeo:Customer/com:Address/com:LineFour"/>
                          </com:LineFour>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:CityName">
                          <com:CityName>
                            <xsl:value-of select="custeo:Customer/com:Address/com:CityName"/>
                          </com:CityName>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:StateName">
                          <com:StateName>
                            <xsl:value-of select="custeo:Customer/com:Address/com:StateName"/>
                          </com:StateName>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:CountyName">
                          <com:CountyName>
                            <xsl:value-of select="custeo:Customer/com:Address/com:CountyName"/>
                          </com:CountyName>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:CountryName">
                          <com:CountryName>
                            <xsl:value-of select="custeo:Customer/com:Address/com:CountryName"/>
                          </com:CountryName>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:PostalCode">
                          <com:PostalCode>
                            <xsl:value-of select="custeo:Customer/com:Address/com:PostalCode"/>
                          </com:PostalCode>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Address/com:PreferredIndicator">
                          <com:PreferredIndicator>
                            <xsl:value-of select="custeo:Customer/com:Address/com:PreferredIndicator"/>
                          </com:PreferredIndicator>
                        </xsl:if>
                      </com:Address>
                    </xsl:if>
                    <xsl:if test="custeo:Customer/com:Phone">
                      <com:Phone>
                        <xsl:if test="custeo:Customer/com:Phone/com:PhoneType">
                          <com:PhoneType>
                            <xsl:value-of select="custeo:Customer/com:Phone/com:PhoneType"/>
                          </com:PhoneType>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Phone/com:CompleteNumber">
                          <com:CompleteNumber>
                            <xsl:value-of select="custeo:Customer/com:Phone/com:CompleteNumber"/>
                          </com:CompleteNumber>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Phone/com:CountryCode">
                          <com:CountryCode>
                            <xsl:value-of select="custeo:Customer/com:Phone/com:CountryCode"/>
                          </com:CountryCode>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Phone/com:AreaCode">
                          <com:AreaCode>
                            <xsl:value-of select="custeo:Customer/com:Phone/com:AreaCode"/>
                          </com:AreaCode>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Phone/com:LocalNumber">
                          <com:LocalNumber>
                            <xsl:value-of select="custeo:Customer/com:Phone/com:LocalNumber"/>
                          </com:LocalNumber>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Phone/com:ExtensionNumber">
                          <com:ExtensionNumber>
                            <xsl:value-of select="custeo:Customer/com:Phone/com:ExtensionNumber"/>
                          </com:ExtensionNumber>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Phone/com:PreferredIndicator">
                          <com:PreferredIndicator>
                            <xsl:value-of select="custeo:Customer/com:Phone/com:PreferredIndicator"/>
                          </com:PreferredIndicator>
                        </xsl:if>
                      </com:Phone>
                    </xsl:if>
                    <xsl:if test="custeo:Customer/com:Email">
                      <com:Email>
                        <xsl:if test="custeo:Customer/com:Email/com:EmailType">
                          <com:EmailType>
                            <xsl:value-of select="custeo:Customer/com:Email/com:EmailType"/>
                          </com:EmailType>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Email/com:EmailAddress">
                          <com:EmailAddress>
                            <xsl:value-of select="custeo:Customer/com:Email/com:EmailAddress"/>
                          </com:EmailAddress>
                        </xsl:if>
                        <xsl:if test="custeo:Customer/com:Email/com:PreferredIndicator">
                          <com:PreferredIndicator>
                            <xsl:value-of select="custeo:Customer/com:Email/com:PreferredIndicator"/>
                          </com:PreferredIndicator>
                        </xsl:if>
                      </com:Email>
                    </xsl:if>
                    <xsl:if test="custeo:Customer/custeo:CustomerStatus">
                      <custeo:CustomerStatus>
                        <xsl:value-of select="custeo:Customer/custeo:CustomerStatus"/>
                      </custeo:CustomerStatus>
                    </xsl:if>
                  </custeo:Customer>
                </xsl:if>
                <xsl:if test="acceo:AccountStatus">
                  <acceo:AccountStatus>
                    <xsl:value-of select="acceo:AccountStatus"/>
                  </acceo:AccountStatus>
                </xsl:if>
              </rs:Account>
            </xsl:for-each>
          </xsl:if>
          <xsl:if test="/acceo:ESBMsg/acceo:RsData/com:Status">
            <com:Status>
              <xsl:if test="/acceo:ESBMsg/acceo:RsData/com:Status/com:Code">
                <com:Code>
                  <xsl:value-of select="/acceo:ESBMsg/acceo:RsData/com:Status/com:Code"/>
                </com:Code>
              </xsl:if>
              <xsl:if test="/acceo:ESBMsg/acceo:RsData/com:Status/com:Type">
                <com:Type>
                  <xsl:value-of select="/acceo:ESBMsg/acceo:RsData/com:Status/com:Type"/>
                </com:Type>
              </xsl:if>
              <xsl:if test="/acceo:ESBMsg/acceo:RsData/com:Status/com:Text">
                <com:Text>
                  <xsl:value-of select="/acceo:ESBMsg/acceo:RsData/com:Status/com:Text"/>
                </com:Text>
              </xsl:if>
            </com:Status>
          </xsl:if>
        </rs:RsData>
      </xsl:if>
    </rs:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
