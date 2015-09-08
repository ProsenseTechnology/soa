<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
                xmlns:v1="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Transfer/V1"
                xmlns:v11="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1"
                xmlns:v12="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app v13 com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Transfer/V1/TransferRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Transfer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:param name="TransRefNum"/>
  <xsl:template match="/">
    <v1:ESBMsg>
      <v11:MsgID>
        <xsl:value-of select="/v13:ESBMsg/v12:MsgID"/>
      </v11:MsgID>
      <xsl:if test="/v13:ESBMsg/v13:RsData">
        <v1:RsData>
          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer">
            <v1:Transfer>
              <v1:TransferIdentifier>
                <v12:BankID>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:TransferIdentifier/v12:BankID"/>
                </v12:BankID>
                <v12:TransactionReferenceNumber>
                  <xsl:value-of select="$TransRefNum"/>
                </v12:TransactionReferenceNumber>
                <v12:TransferID>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:TransferIdentifier/v12:TransferID"/>
                </v12:TransferID>
              </v1:TransferIdentifier>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:TransferType">
                <v13:TransferType>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:TransferType"/>
                </v13:TransferType>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:PurposeCode">
                <v13:PurposeCode>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:PurposeCode"/>
                </v13:PurposeCode>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:ChargeEventID">
                <v13:ChargeEventID>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:ChargeEventID"/>
                </v13:ChargeEventID>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:ChargeOption">
                <v13:ChargeOption>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:ChargeOption"/>
                </v13:ChargeOption>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:WaiveChargesIndicator">
                <v13:WaiveChargesIndicator>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:WaiveChargesIndicator"/>
                </v13:WaiveChargesIndicator>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:TransferOrderType">
                <v13:TransferOrderType>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:TransferOrderType"/>
                </v13:TransferOrderType>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Amount">
                <v11:Amount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Amount/@currencyCode">
                    <v11:CurrencyCode>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Amount/@currencyCode"/>
                    </v11:CurrencyCode>
                  </xsl:if>
                </v11:Amount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:InstructedAmount">
                <v1:InstructedAmount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:InstructedAmount/@currencyCode">
                    <v11:CurrencyCode>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:InstructedAmount/@currencyCode"/>
                    </v11:CurrencyCode>
                  </xsl:if>
                </v1:InstructedAmount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:ChargeAmount">
                <v11:ChargeAmount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:ChargeAmount/@currencyCode">
                    <v11:CurrencyCode>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:ChargeAmount/@currencyCode"/>
                    </v11:CurrencyCode>
                  </xsl:if>
                </v11:ChargeAmount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:ValueDate">
                <v12:ValueDate>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:ValueDate"/>
                </v12:ValueDate>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:DebitValueDate">
                <v13:DebitValueDate>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:DebitValueDate"/>
                </v13:DebitValueDate>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:DebitExecutionDate">
                <v13:DebitExecutionDate>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:DebitExecutionDate"/>
                </v13:DebitExecutionDate>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:CreditValueDate">
                <v13:CreditValueDate>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:CreditValueDate"/>
                </v13:CreditValueDate>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:CreditExecutionDate">
                <v13:CreditExecutionDate>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:CreditExecutionDate"/>
                </v13:CreditExecutionDate>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Rate">
                <v11:Rate>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Rate/@baseValue">
                    <v11:Value>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Rate/@baseValue"/>
                    </v11:Value>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Rate/@baseValue">
                    <v11:BaseValue>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Rate/@baseValue"/>
                    </v11:BaseValue>
                  </xsl:if>
                </v11:Rate>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Remarks">
                <v12:Remarks>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:Remarks"/>
                </v12:Remarks>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:TransferReferenceNumber">
                <v13:TransferReferenceNumber>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:TransferReferenceNumber"/>
                </v13:TransferReferenceNumber>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount">
                <v12:PayFromAccount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier">
                    <v12:AccountIdentifier>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:BankID">
                        <v12:BankID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:BankID"/>
                        </v12:BankID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:BankBIC">
                        <v12:BankBIC>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:BankBIC"/>
                        </v12:BankBIC>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:BranchID">
                        <v12:BranchID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:BranchID"/>
                        </v12:BranchID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:AccountID">
                        <v12:AccountID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:AccountID"/>
                        </v12:AccountID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:AccountCurrency">
                        <v12:AccountCurrency>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:AccountIdentifier/v12:AccountCurrency"/>
                        </v12:AccountCurrency>
                      </xsl:if>
                    </v12:AccountIdentifier>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference">
                    <v12:PartyReference>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:OrganizationName">
                        <v12:OrganizationName>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:OrganizationName"/>
                        </v12:OrganizationName>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName">
                        <v12:PersonName>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:FullName">
                            <v12:FullName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:FullName"/>
                            </v12:FullName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:FirstName">
                            <v12:FirstName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:FirstName"/>
                            </v12:FirstName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:MiddleName">
                            <v12:MiddleName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:MiddleName"/>
                            </v12:MiddleName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:LastName">
                            <v12:LastName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:LastName"/>
                            </v12:LastName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:Title">
                            <v12:Title>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:PersonName/v12:Title"/>
                            </v12:Title>
                          </xsl:if>
                        </v12:PersonName>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address">
                        <v12:Address>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:AddressType">
                            <v12:AddressType>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:AddressType"/>
                            </v12:AddressType>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:LineOne">
                            <v12:LineOne>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:LineOne"/>
                            </v12:LineOne>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:LineTwo">
                            <v12:LineTwo>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:LineTwo"/>
                            </v12:LineTwo>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:LineThree">
                            <v12:LineThree>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:LineThree"/>
                            </v12:LineThree>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:LineFour">
                            <v12:LineFour>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:LineFour"/>
                            </v12:LineFour>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:CityName">
                            <v12:CityName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:CityName"/>
                            </v12:CityName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:StateName">
                            <v12:StateName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:StateName"/>
                            </v12:StateName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:CountyName">
                            <v12:CountyName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:CountyName"/>
                            </v12:CountyName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:CountryName">
                            <v12:CountryName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:CountryName"/>
                            </v12:CountryName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:PostalCode">
                            <v12:PostalCode>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:PostalCode"/>
                            </v12:PostalCode>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:PreferredIndicator">
                            <v12:PreferredIndicator>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromAccount/v12:PartyReference/v12:Address/v12:PreferredIndicator"/>
                            </v12:PreferredIndicator>
                          </xsl:if>
                        </v12:Address>
                      </xsl:if>
                    </v12:PartyReference>
                  </xsl:if>
                </v12:PayFromAccount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount">
                <v12:PayeeAccount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier">
                    <v12:AccountIdentifier>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:BankID">
                        <v12:BankID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:BankID"/>
                        </v12:BankID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:BankBIC">
                        <v12:BankBIC>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:BankBIC"/>
                        </v12:BankBIC>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:BranchID">
                        <v12:BranchID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:BranchID"/>
                        </v12:BranchID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:AccountID">
                        <v12:AccountID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:AccountID"/>
                        </v12:AccountID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:AccountCurrency">
                        <v12:AccountCurrency>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:AccountIdentifier/v12:AccountCurrency"/>
                        </v12:AccountCurrency>
                      </xsl:if>
                    </v12:AccountIdentifier>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference">
                    <v12:PartyReference>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:OrganizationName">
                        <v12:OrganizationName>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:OrganizationName"/>
                        </v12:OrganizationName>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName">
                        <v12:PersonName>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:FullName">
                            <v12:FullName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:FullName"/>
                            </v12:FullName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:FirstName">
                            <v12:FirstName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:FirstName"/>
                            </v12:FirstName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:MiddleName">
                            <v12:MiddleName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:MiddleName"/>
                            </v12:MiddleName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:LastName">
                            <v12:LastName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:LastName"/>
                            </v12:LastName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:Title">
                            <v12:Title>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:PersonName/v12:Title"/>
                            </v12:Title>
                          </xsl:if>
                        </v12:PersonName>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address">
                        <v12:Address>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:AddressType">
                            <v12:AddressType>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:AddressType"/>
                            </v12:AddressType>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:LineOne">
                            <v12:LineOne>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:LineOne"/>
                            </v12:LineOne>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:LineTwo">
                            <v12:LineTwo>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:LineTwo"/>
                            </v12:LineTwo>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:LineThree">
                            <v12:LineThree>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:LineThree"/>
                            </v12:LineThree>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:LineFour">
                            <v12:LineFour>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:LineFour"/>
                            </v12:LineFour>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:CityName">
                            <v12:CityName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:CityName"/>
                            </v12:CityName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:StateName">
                            <v12:StateName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:StateName"/>
                            </v12:StateName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:CountyName">
                            <v12:CountyName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:CountyName"/>
                            </v12:CountyName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:CountryName">
                            <v12:CountryName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:CountryName"/>
                            </v12:CountryName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:PostalCode">
                            <v12:PostalCode>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:PostalCode"/>
                            </v12:PostalCode>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:PreferredIndicator">
                            <v12:PreferredIndicator>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeAccount/v12:PartyReference/v12:Address/v12:PreferredIndicator"/>
                            </v12:PreferredIndicator>
                          </xsl:if>
                        </v12:Address>
                      </xsl:if>
                    </v12:PartyReference>
                  </xsl:if>
                </v12:PayeeAccount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:CountryCode">
                <v12:CountryCode>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:CountryCode"/>
                </v12:CountryCode>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryIndicator">
                <v13:IntermediaryIndicator>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryIndicator"/>
                </v13:IntermediaryIndicator>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount">
                <v13:IntermediaryAccount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier">
                    <v12:AccountIdentifier>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:BankID">
                        <v12:BankID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:BankID"/>
                        </v12:BankID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:BankBIC">
                        <v12:BankBIC>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:BankBIC"/>
                        </v12:BankBIC>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:BranchID">
                        <v12:BranchID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:BranchID"/>
                        </v12:BranchID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:AccountID">
                        <v12:AccountID>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:AccountID"/>
                        </v12:AccountID>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:AccountCurrency">
                        <v12:AccountCurrency>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:AccountIdentifier/v12:AccountCurrency"/>
                        </v12:AccountCurrency>
                      </xsl:if>
                    </v12:AccountIdentifier>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference">
                    <v12:PartyReference>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:OrganizationName">
                        <v12:OrganizationName>
                          <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:OrganizationName"/>
                        </v12:OrganizationName>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName">
                        <v12:PersonName>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:FullName">
                            <v12:FullName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:FullName"/>
                            </v12:FullName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:FirstName">
                            <v12:FirstName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:FirstName"/>
                            </v12:FirstName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:MiddleName">
                            <v12:MiddleName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:MiddleName"/>
                            </v12:MiddleName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:LastName">
                            <v12:LastName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:LastName"/>
                            </v12:LastName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:Title">
                            <v12:Title>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:PersonName/v12:Title"/>
                            </v12:Title>
                          </xsl:if>
                        </v12:PersonName>
                      </xsl:if>
                      <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address">
                        <v12:Address>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:AddressType">
                            <v12:AddressType>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:AddressType"/>
                            </v12:AddressType>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:LineOne">
                            <v12:LineOne>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:LineOne"/>
                            </v12:LineOne>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:LineTwo">
                            <v12:LineTwo>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:LineTwo"/>
                            </v12:LineTwo>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:LineThree">
                            <v12:LineThree>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:LineThree"/>
                            </v12:LineThree>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:LineFour">
                            <v12:LineFour>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:LineFour"/>
                            </v12:LineFour>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:CityName">
                            <v12:CityName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:CityName"/>
                            </v12:CityName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:StateName">
                            <v12:StateName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:StateName"/>
                            </v12:StateName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:CountyName">
                            <v12:CountyName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:CountyName"/>
                            </v12:CountyName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:CountryName">
                            <v12:CountryName>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:CountryName"/>
                            </v12:CountryName>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:PostalCode">
                            <v12:PostalCode>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:PostalCode"/>
                            </v12:PostalCode>
                          </xsl:if>
                          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:PreferredIndicator">
                            <v12:PreferredIndicator>
                              <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:IntermediaryAccount/v12:PartyReference/v12:Address/v12:PreferredIndicator"/>
                            </v12:PreferredIndicator>
                          </xsl:if>
                        </v12:Address>
                      </xsl:if>
                    </v12:PartyReference>
                  </xsl:if>
                </v13:IntermediaryAccount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:MobileWalletVendor">
                <v12:MobileWalletVendor>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:MobileWalletVendor"/>
                </v12:MobileWalletVendor>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromMobileWallet">
                <v12:PayFromMobileWallet>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromMobileWallet/v12:MobileNumber">
                    <v12:MobileNumber>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromMobileWallet/v12:MobileNumber"/>
                    </v12:MobileNumber>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromMobileWallet/v12:MobileUser">
                    <v12:MobileUser>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayFromMobileWallet/v12:MobileUser"/>
                    </v12:MobileUser>
                  </xsl:if>
                </v12:PayFromMobileWallet>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeMobileWallet">
                <v12:PayeeMobileWallet>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeMobileWallet/v12:MobileNumber">
                    <v12:MobileNumber>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeMobileWallet/v12:MobileNumber"/>
                    </v12:MobileNumber>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeMobileWallet/v12:MobileUser">
                    <v12:MobileUser>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v12:PayeeMobileWallet/v12:MobileUser"/>
                    </v12:MobileUser>
                  </xsl:if>
                </v12:PayeeMobileWallet>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:TransferStatus">
                <v13:TransferStatus>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Transfer/v13:TransferStatus"/>
                </v13:TransferStatus>
              </xsl:if>
            </v1:Transfer>
          </xsl:if>
          <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status">
            <v12:Status>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status/v12:Code">
                <v12:Code>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Code"/>
                </v12:Code>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type">
                <v12:Type>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type"/>
                </v12:Type>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status/v12:Text">
                <v12:Text>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Text"/>
                </v12:Text>
              </xsl:if>
            </v12:Status>
          </xsl:if>
        </v1:RsData>
      </xsl:if>
    </v1:ESBMsg>
  </xsl:template>
</xsl:stylesheet>