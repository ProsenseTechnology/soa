<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:accteo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:acctbo="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd acctbo accteo xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/BusinessServices/RetailBanking/Account/V1/AccountBO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"/>
        <oracle-xsl-mapper:param name="accountOpeningDO"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/BusinessServices/RetailBanking/Account/V1/AccountBO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"/>
        <oracle-xsl-mapper:param name="accountOpeningRespDO"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:param name="accountOpeningRespDO"/>
  <xsl:template match="/">
    <accteo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/acctbo:ESBMsg/com:MsgID"/>
      </com:MsgID>
      <com:Source>
        <xsl:value-of select="/acctbo:ESBMsg/com:Source"/>
      </com:Source>
      <com:MsgType>
        <xsl:value-of select="/acctbo:ESBMsg/com:MsgType"/>
      </com:MsgType>
      <com:Service>
        <xsl:value-of select="/acctbo:ESBMsg/com:Service"/>
      </com:Service>
      <accteo:RqData actionCode="{/acctbo:ESBMsg/acctbo:RqData/@actionCode}">
        <xsl:for-each select="/acctbo:ESBMsg/acctbo:RqData/accteo:Account">
          <accteo:Account>
            <com:AccountIdentifier>
              <com:BankID>
                <xsl:value-of select="$accountOpeningRespDO/acctbo:ESBMsg/acctbo:RsData/bio:Biometric/com:CustomerIdentifier/com:BankID"/>
              </com:BankID>
              <com:BranchID>
                <xsl:value-of select="$accountOpeningRespDO/acctbo:ESBMsg/acctbo:RsData/bio:Biometric/com:CustomerIdentifier/com:BranchID"/>
              </com:BranchID>
            </com:AccountIdentifier>
            <accteo:AccountType>
              <xsl:value-of select="accteo:AccountType"/>
            </accteo:AccountType>
            <custeo:Customer>
              <com:CustomerIdentifier>
                <com:CustomerID>
                  <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:CustomerIdentifier/com:CustomerID"/>
                </com:CustomerID>
                <com:BranchID>
                  <xsl:value-of select="$accountOpeningRespDO/acctbo:ESBMsg/acctbo:RsData/bio:Biometric/com:CustomerIdentifier/com:BranchID"/>
                </com:BranchID>
              </com:CustomerIdentifier>
              <com:Person>
                <com:MaritalStatus>
                  <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:MaritalStatus"/>
                </com:MaritalStatus>
                <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment">
                  <com:Employment>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:CompanyID">
                      <com:CompanyID>
                        <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:CompanyID"/>
                      </com:CompanyID>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:CompanyName">
                      <com:CompanyName>
                        <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:CompanyName"/>
                      </com:CompanyName>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Income">
                      <com:Income>
                        <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Income"/>
                      </com:Income>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Occupation">
                      <com:Occupation>
                        <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Occupation"/>
                      </com:Occupation>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:EmploymentStatus">
                      <com:EmploymentStatus>
                        <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:EmploymentStatus"/>
                      </com:EmploymentStatus>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:TimeInEmploymentYY">
                      <com:TimeInEmploymentYY>
                        <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:TimeInEmploymentYY"/>
                      </com:TimeInEmploymentYY>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:TimeInEmploymentMM">
                      <com:TimeInEmploymentMM>
                        <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:TimeInEmploymentMM"/>
                      </com:TimeInEmploymentMM>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address">
                      <com:Address>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:AddressType">
                          <com:AddressType>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:AddressType"/>
                          </com:AddressType>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:LineOne">
                          <com:LineOne>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:LineOne"/>
                          </com:LineOne>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:LineTwo">
                          <com:LineTwo>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:LineTwo"/>
                          </com:LineTwo>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:LineThree">
                          <com:LineThree>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:LineThree"/>
                          </com:LineThree>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:LineFour">
                          <com:LineFour>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:LineFour"/>
                          </com:LineFour>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:CityName">
                          <com:CityName>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:CityName"/>
                          </com:CityName>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:StateName">
                          <com:StateName>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:StateName"/>
                          </com:StateName>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:CountyName">
                          <com:CountyName>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:CountyName"/>
                          </com:CountyName>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:CountryName">
                          <com:CountryName>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:CountryName"/>
                          </com:CountryName>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:PostalCode">
                          <com:PostalCode>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:PostalCode"/>
                          </com:PostalCode>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:PreferredIndicator">
                          <com:PreferredIndicator>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Address/com:PreferredIndicator"/>
                          </com:PreferredIndicator>
                        </xsl:if>
                      </com:Address>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone">
                      <com:Phone>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:PhoneType">
                          <com:PhoneType>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:PhoneType"/>
                          </com:PhoneType>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:CompleteNumber">
                          <com:CompleteNumber>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:CompleteNumber"/>
                          </com:CompleteNumber>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:CountryCode">
                          <com:CountryCode>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:CountryCode"/>
                          </com:CountryCode>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:AreaCode">
                          <com:AreaCode>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:AreaCode"/>
                          </com:AreaCode>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:LocalNumber">
                          <com:LocalNumber>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:LocalNumber"/>
                          </com:LocalNumber>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:ExtensionNumber">
                          <com:ExtensionNumber>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:ExtensionNumber"/>
                          </com:ExtensionNumber>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:PreferredIndicator">
                          <com:PreferredIndicator>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Phone/com:PreferredIndicator"/>
                          </com:PreferredIndicator>
                        </xsl:if>
                      </com:Phone>
                    </xsl:if>
                    <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Email">
                      <com:Email>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Email/com:EmailType">
                          <com:EmailType>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Email/com:EmailType"/>
                          </com:EmailType>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Email/com:EmailAddress">
                          <com:EmailAddress>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Email/com:EmailAddress"/>
                          </com:EmailAddress>
                        </xsl:if>
                        <xsl:if test="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Email/com:PreferredIndicator">
                          <com:PreferredIndicator>
                            <xsl:value-of select="/acctbo:ESBMsg/acctbo:RqData/custeo:Customer/com:Person/com:Employment/com:Email/com:PreferredIndicator"/>
                          </com:PreferredIndicator>
                        </xsl:if>
                      </com:Email>
                    </xsl:if>
                  </com:Employment>
                </xsl:if>
              </com:Person>
            </custeo:Customer>
            <accteo:LoanProducts>
              <xsl:value-of select="accteo:LoanProducts"/>
            </accteo:LoanProducts>
            <accteo:LoanAmount>
              <xsl:value-of select="accteo:LoanAmount"/>
            </accteo:LoanAmount>
            <accteo:LoanPeriod>
              <xsl:value-of select="accteo:LoanPeriod"/>
            </accteo:LoanPeriod>
            <accteo:ResidentialStatus>
              <xsl:value-of select="accteo:ResidentialStatus"/>
            </accteo:ResidentialStatus>
            <accteo:TimeAtAdressYY>
              <xsl:value-of select="accteo:TimeAtAdressYY"/>
            </accteo:TimeAtAdressYY>
            <accteo:TimeAtAdressMM>
              <xsl:value-of select="accteo:TimeAtAdressMM"/>
            </accteo:TimeAtAdressMM>
            <xsl:for-each select="com:GoodsCategory">
              <com:GoodsCategory>
                <xsl:if test="com:Good_Category">
                  <com:Good_Category>
                    <xsl:value-of select="com:Good_Category"/>
                  </com:Good_Category>
                </xsl:if>
                <xsl:if test="com:Good">
                  <com:Good>
                    <xsl:value-of select="com:Good"/>
                  </com:Good>
                </xsl:if>
                <xsl:if test="com:Good_Amount">
                  <com:Good_Amount>
                    <xsl:if test="com:Good_Amount/@currencyCode">
                      <xsl:attribute name="currencyCode">
                        <xsl:value-of select="com:Good_Amount/@currencyCode"/>
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="com:Good_Amount"/>
                  </com:Good_Amount>
                </xsl:if>
              </com:GoodsCategory>
            </xsl:for-each>
            <accteo:MerchantReferenceNumber>
              <xsl:value-of select="accteo:MerchantReferenceNumber"/>
            </accteo:MerchantReferenceNumber>
            <accteo:MerchantID>
              <xsl:value-of select="accteo:MerchantID"/>
            </accteo:MerchantID>
            <xsl:if test="accteo:ClientContribution">
              <accteo:ClientContribution>
                <xsl:value-of select="accteo:ClientContribution"/>
              </accteo:ClientContribution>
            </xsl:if>
          </accteo:Account>
        </xsl:for-each>
      </accteo:RqData>
    </accteo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
