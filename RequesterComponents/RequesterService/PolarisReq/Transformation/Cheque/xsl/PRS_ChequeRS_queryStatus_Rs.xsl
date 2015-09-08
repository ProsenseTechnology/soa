<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Cheque/V1"
                xmlns:rs="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Cheque/V1"
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
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Instruments/Cheque/V1/ChequeEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Cheque/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Cheque/V1/ChequeRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Cheque/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <rs:ESBMsg>
      <rcom:MsgID>
        <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
      </rcom:MsgID>
      <xsl:if test="/eo:ESBMsg/eo:RsData">
        <rs:RsData>
          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque">
            <rs:Cheque>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier">
                <com:ChequeIdentifier>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:BankID">
                    <com:BankID>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:BankID"/>
                    </com:BankID>
                  </xsl:if>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:BankBIC">
                    <com:BankBIC>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:BankBIC"/>
                    </com:BankBIC>
                  </xsl:if>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:BranchID">
                    <com:BranchID>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:BranchID"/>
                    </com:BranchID>
                  </xsl:if>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:AccountID">
                    <com:AccountID>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:AccountID"/>
                    </com:AccountID>
                  </xsl:if>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:AccountCurrency">
                    <com:AccountCurrency>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:AccountCurrency"/>
                    </com:AccountCurrency>
                  </xsl:if>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:ChequeID">
                    <com:ChequeID>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:ChequeIdentifier/com:ChequeID"/>
                    </com:ChequeID>
                  </xsl:if>
                </com:ChequeIdentifier>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:ChequeType">
                <eo:ChequeType>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:ChequeType"/>
                </eo:ChequeType>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:Memo">
                <eo:Memo>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:Memo"/>
                </eo:Memo>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:IssueDate">
                <eo:IssueDate>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:IssueDate"/>
                </eo:IssueDate>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:Amount">
                <rcom:Amount>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:Amount/@currencyCode">
                    <rcom:CurrencyCode>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:Amount/@currencyCode"/>
                    </rcom:CurrencyCode>
                  </xsl:if>
                </rcom:Amount>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:NoOfLeaves">
                <com:NoOfLeaves>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:NoOfLeaves"/>
                </com:NoOfLeaves>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:BeginChequeNumber">
                <eo:BeginChequeNumber>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:BeginChequeNumber"/>
                </eo:BeginChequeNumber>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:EndChequeNumber">
                <eo:EndChequeNumber>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:EndChequeNumber"/>
                </eo:EndChequeNumber>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount">
                <com:PayeeAccount>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier">
                    <com:AccountIdentifier>
                      <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:BankID">
                        <com:BankID>
                          <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:BankID"/>
                        </com:BankID>
                      </xsl:if>
                      <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:BankBIC">
                        <com:BankBIC>
                          <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:BankBIC"/>
                        </com:BankBIC>
                      </xsl:if>
                      <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:BranchID">
                        <com:BranchID>
                          <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:BranchID"/>
                        </com:BranchID>
                      </xsl:if>
                      <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:AccountID">
                        <com:AccountID>
                          <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:AccountID"/>
                        </com:AccountID>
                      </xsl:if>
                      <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:AccountCurrency">
                        <com:AccountCurrency>
                          <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:AccountIdentifier/com:AccountCurrency"/>
                        </com:AccountCurrency>
                      </xsl:if>
                    </com:AccountIdentifier>
                  </xsl:if>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference">
                    <com:PartyReference>
                      <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:OrganizationName">
                        <com:OrganizationName>
                          <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:OrganizationName"/>
                        </com:OrganizationName>
                      </xsl:if>
                      <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName">
                        <com:PersonName>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:FullName">
                            <com:FullName>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:FullName"/>
                            </com:FullName>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:FirstName">
                            <com:FirstName>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:FirstName"/>
                            </com:FirstName>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:MiddleName">
                            <com:MiddleName>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:MiddleName"/>
                            </com:MiddleName>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:LastName">
                            <com:LastName>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:LastName"/>
                            </com:LastName>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:Title">
                            <com:Title>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:PersonName/com:Title"/>
                            </com:Title>
                          </xsl:if>
                        </com:PersonName>
                      </xsl:if>
                      <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address">
                        <com:Address>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:AddressType">
                            <com:AddressType>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:AddressType"/>
                            </com:AddressType>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:LineOne">
                            <com:LineOne>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:LineOne"/>
                            </com:LineOne>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:LineTwo">
                            <com:LineTwo>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:LineTwo"/>
                            </com:LineTwo>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:LineThree">
                            <com:LineThree>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:LineThree"/>
                            </com:LineThree>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:LineFour">
                            <com:LineFour>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:LineFour"/>
                            </com:LineFour>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:CityName">
                            <com:CityName>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:CityName"/>
                            </com:CityName>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:StateName">
                            <com:StateName>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:StateName"/>
                            </com:StateName>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:CountyName">
                            <com:CountyName>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:CountyName"/>
                            </com:CountyName>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:CountryName">
                            <com:CountryName>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:CountryName"/>
                            </com:CountryName>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:PostalCode">
                            <com:PostalCode>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:PostalCode"/>
                            </com:PostalCode>
                          </xsl:if>
                          <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:PreferredIndicator">
                            <com:PreferredIndicator>
                              <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:PayeeAccount/com:PartyReference/com:Address/com:PreferredIndicator"/>
                            </com:PreferredIndicator>
                          </xsl:if>
                        </com:Address>
                      </xsl:if>
                    </com:PartyReference>
                  </xsl:if>
                </com:PayeeAccount>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:StopPaymentInstruction">
                <com:StopPaymentInstruction>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:StopPaymentInstruction/com:RequestDateTime">
                    <com:RequestDateTime>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:StopPaymentInstruction/com:RequestDateTime"/>
                    </com:RequestDateTime>
                  </xsl:if>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:StopPaymentInstruction/com:ReasonCode">
                    <com:ReasonCode>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:StopPaymentInstruction/com:ReasonCode"/>
                    </com:ReasonCode>
                  </xsl:if>
                  <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/com:StopPaymentInstruction/com:ReasonDescription">
                    <com:ReasonDescription>
                      <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/com:StopPaymentInstruction/com:ReasonDescription"/>
                    </com:ReasonDescription>
                  </xsl:if>
                </com:StopPaymentInstruction>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:ChequeStatus">
                <eo:ChequeStatus>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/eo:Cheque/eo:ChequeStatus"/>
                </eo:ChequeStatus>
              </xsl:if>
            </rs:Cheque>
          </xsl:if>
          <xsl:if test="/eo:ESBMsg/eo:RsData/com:Status">
            <com:Status>
              <xsl:if test="/eo:ESBMsg/eo:RsData/com:Status/com:Code">
                <com:Code>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/com:Status/com:Code"/>
                </com:Code>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/com:Status/com:Type">
                <com:Type>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/com:Status/com:Type"/>
                </com:Type>
              </xsl:if>
              <xsl:if test="/eo:ESBMsg/eo:RsData/com:Status/com:Text">
                <com:Text>
                  <xsl:value-of select="/eo:ESBMsg/eo:RsData/com:Status/com:Text"/>
                </com:Text>
              </xsl:if>
            </com:Status>
          </xsl:if>
        </rs:RsData>
      </xsl:if>
    </rs:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
