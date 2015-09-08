<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"
                xmlns:ns3="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1">
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
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Customer/V1/CustomerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:param name="accountOpeningRespDO"/>
  <xsl:template match="/">
    <tns:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/ns0:ESBMsg/com:MsgID"/>
      </com:MsgID>
      <com:Source>
        <xsl:value-of select="/ns0:ESBMsg/com:Source"/>
      </com:Source>
      <com:MsgType>
        <xsl:value-of select="/ns0:ESBMsg/com:MsgType"/>
      </com:MsgType>
      <com:Service>
        <xsl:value-of select="/ns0:ESBMsg/com:Service"/>
      </com:Service>
      <tns:RqData actionCode="CreateRetailCustomer">
        <tns:Customer>
          <com:CustomerIdentifier>
            <com:BankID>
              <xsl:value-of select="$accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/bio:Biometric/com:CustomerIdentifier/com:BankID"/>
            </com:BankID>
            <com:BranchID>
              <xsl:value-of select="$accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/bio:Biometric/com:CustomerIdentifier/com:BranchID"/>
            </com:BranchID>
          </com:CustomerIdentifier>
          <com:Person>
            <com:PersonName>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:FullName/text()">
                <com:FullName>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:FullName"/>
                </com:FullName>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:FirstName/text()">
                <com:FirstName>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:FirstName"/>
                </com:FirstName>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:MiddleName/text()">
                <com:MiddleName>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:MiddleName"/>
                </com:MiddleName>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:LastName/text()">
                <com:LastName>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:LastName"/>
                </com:LastName>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:ShortName/text()">
                <com:ShortName>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:ShortName"/>
                </com:ShortName>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:Title/text()">
                <com:Title>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:PersonName/com:Title"/>
                </com:Title>
              </xsl:if>
            </com:PersonName>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:BirthDate/text()">
              <com:BirthDate>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:BirthDate"/>
              </com:BirthDate>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:DeathDate/text()">
              <com:DeathDate>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:DeathDate"/>
              </com:DeathDate>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:BirthCountry/text()">
              <com:BirthCountry>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:BirthCountry"/>
              </com:BirthCountry>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:BirthCityName/text()">
              <com:BirthCityName>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:BirthCityName"/>
              </com:BirthCityName>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:GenderCode/text()">
              <com:GenderCode>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:GenderCode"/>
              </com:GenderCode>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Language/text()">
              <com:Language>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Language"/>
              </com:Language>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:NativeLanguage/text()">
              <com:NativeLanguage>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:NativeLanguage"/>
              </com:NativeLanguage>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Nationality/text()">
              <com:Nationality>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Nationality"/>
              </com:Nationality>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:MaritalStatus/text()">
              <com:MaritalStatus>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:MaritalStatus"/>
              </com:MaritalStatus>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:MinorIndicator/text()">
              <com:MinorIndicator>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:MinorIndicator"/>
              </com:MinorIndicator>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:NREIndicator/text()">
              <com:NREIndicator>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:NREIndicator"/>
              </com:NREIndicator>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Occupation/text()">
              <com:Occupation>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Occupation"/>
              </com:Occupation>
            </xsl:if>
            <com:Employment>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:CompanyID/text()">
                <com:CompanyID>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:CompanyID"/>
                </com:CompanyID>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:CompanyName/text()">
                <com:CompanyName>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:CompanyName"/>
                </com:CompanyName>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Income/text()">
                <com:Income>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Income"/>
                </com:Income>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Occupation/text()">
                <com:Occupation>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Occupation"/>
                </com:Occupation>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/text()">
                <com:Address>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:AddressType/text()">
                    <com:AddressType>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:AddressType"/>
                    </com:AddressType>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:LineOne/text()">
                    <com:LineOne>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:LineOne"/>
                    </com:LineOne>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:LineTwo/text()">
                    <com:LineTwo>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:LineTwo"/>
                    </com:LineTwo>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:LineThree/text()">
                    <com:LineThree>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:LineThree"/>
                    </com:LineThree>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:LineFour/text()">
                    <com:LineFour>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:LineFour"/>
                    </com:LineFour>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:CityName/text()">
                    <com:CityName>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:CityName"/>
                    </com:CityName>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:StateName/text()">
                    <com:StateName>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:StateName"/>
                    </com:StateName>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:CountyName/text()">
                    <com:CountyName>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:CountyName"/>
                    </com:CountyName>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:CountryName/text()">
                    <com:CountryName>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:CountryName"/>
                    </com:CountryName>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:PostalCode/text()">
                    <com:PostalCode>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:PostalCode"/>
                    </com:PostalCode>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:PreferredIndicator/text()">
                    <com:PreferredIndicator>
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Address/com:PreferredIndicator"/>
                    </com:PreferredIndicator>
                  </xsl:if>
                </com:Address>
              </xsl:if>
              <!--xsl:for-each select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Phone">
              
                <com:Phone>
                  <xsl:if test="com:PhoneType/text()">
                    <com:PhoneType>
                      <xsl:value-of select="com:PhoneType"/>
                    </com:PhoneType>
                  </xsl:if>
                  <xsl:choose>
                  <xsl:when test="">
                  <xsl:if test="com:CompleteNumber/text()">
                    <com:CompleteNumber>
                      <xsl:value-of select="com:CompleteNumber"/>
                    </com:CompleteNumber>
                  </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                  <xsl:if test="com:CountryCode/text()">
                    <com:CountryCode>
                      <xsl:value-of select="com:CountryCode"/>
                    </com:CountryCode>
                  </xsl:if>
                  <xsl:if test="com:AreaCode/text()">
                    <com:AreaCode>
                      <xsl:value-of select="com:AreaCode"/>
                    </com:AreaCode>
                  </xsl:if>
                  <xsl:if test="com:LocalNumber/text()">
                    <com:LocalNumber>
                      <xsl:value-of select="com:LocalNumber"/>
                    </com:LocalNumber>
                  </xsl:if>
                  <xsl:if test="com:ExtensionNumber/text()">
                    <com:ExtensionNumber>
                      <xsl:value-of select="com:ExtensionNumber"/>
                    </com:ExtensionNumber>
                  </xsl:if>
                  </xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="com:PreferredIndicator/text()">
                    <com:PreferredIndicator>
                      <xsl:value-of select="com:PreferredIndicator"/>
                    </com:PreferredIndicator>
                  </xsl:if>
                </com:Phone>
              
              </xsl:for-each>
              <xsl:for-each select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:Employment/com:Email">
              
                <com:Email>
                  <xsl:if test="com:EmailType/text()">
                    <com:EmailType>
                      <xsl:value-of select="com:EmailType"/>
                    </com:EmailType>
                  </xsl:if>
                  <xsl:if test="com:EmailAddress/text()">
                    <com:EmailAddress>
                      <xsl:value-of select="com:EmailAddress"/>
                    </com:EmailAddress>
                  </xsl:if>
                  <xsl:if test="com:PreferredIndicator/text()">
                    <com:PreferredIndicator>
                      <xsl:value-of select="com:PreferredIndicator"/>
                    </com:PreferredIndicator>
                  </xsl:if>
                </com:Email>
              
              </xsl:for-each-->
            </com:Employment>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FaceImage/text()">
              <com:FaceImage>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FaceImage"/>
              </com:FaceImage>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/text()">
              <com:FingerPrints>
                <com:ImageL1>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL1/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL1/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL1/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL1/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL1/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL1/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL1"/>
                </com:ImageL1>
                <com:ImageL2>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL2/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL2/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL2/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL2/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL2/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL2/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL2"/>
                </com:ImageL2>
                <com:ImageL3>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL3/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL3/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL3/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL3/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL3/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL3/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL3"/>
                </com:ImageL3>
                <com:ImageL4>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL4/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL4/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL4/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL4/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL4/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL4/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL4"/>
                </com:ImageL4>
                <com:ImageL5>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL5/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL5/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL5/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL5/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL5/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL5/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageL5"/>
                </com:ImageL5>
                <com:ImageR1>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR1/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR1/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR1/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR1/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR1/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR1/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR1"/>
                </com:ImageR1>
                <com:ImageR2>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR2/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR2/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR2/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR2/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR2/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR2/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR2"/>
                </com:ImageR2>
                <com:ImageR3>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR3/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR3/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR3/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR3/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR3/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR3/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR3"/>
                </com:ImageR3>
                <com:ImageR4>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR4/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR4/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR4/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR4/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR4/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR4/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR4"/>
                </com:ImageR4>
                <com:ImageR5>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR5/@mimeCode">
                    <xsl:attribute name="mimeCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR5/@mimeCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR5/@characterSetCode">
                    <xsl:attribute name="characterSetCode">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR5/@characterSetCode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR5/@fileName">
                    <xsl:attribute name="fileName">
                      <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR5/@fileName"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:FingerPrints/com:ImageR5"/>
                </com:ImageR5>
              </com:FingerPrints>
            </xsl:if>
            <com:IdentityDocument>
              <com:IdentityDocumentID>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentID"/>
              </com:IdentityDocumentID>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentSerialNumber/text()">
                <com:IdentityDocumentSerialNumber>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentSerialNumber"/>
                </com:IdentityDocumentSerialNumber>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentType/text()">
                <com:IdentityDocumentType>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentType"/>
                </com:IdentityDocumentType>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IssueDate/text()">
                <com:IssueDate>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IssueDate"/>
                </com:IssueDate>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:ExpirationDate/text()">
                <com:ExpirationDate>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:ExpirationDate"/>
                </com:ExpirationDate>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IssuingCountry/text()">
                <com:IssuingCountry>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IssuingCountry"/>
                </com:IssuingCountry>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IssuingLocation/text()">
                <com:IssuingLocation>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IssuingLocation"/>
                </com:IssuingLocation>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IssuingAuthority/text()">
                <com:IssuingAuthority>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:IssuingAuthority"/>
                </com:IssuingAuthority>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:DocImage1/text()">
                <com:DocImage1>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:DocImage1"/>
                </com:DocImage1>
              </xsl:if>
              <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:DocImage2/text()">
                <com:DocImage2>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Person/com:IdentityDocument/com:DocImage2"/>
                </com:DocImage2>
              </xsl:if>
            </com:IdentityDocument>
          </com:Person>
          <com:Address>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:AddressType/text()">
              <com:AddressType>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:AddressType"/>
              </com:AddressType>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:LineOne/text()">
              <com:LineOne>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:LineOne"/>
              </com:LineOne>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:LineTwo/text()">
              <com:LineTwo>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:LineTwo"/>
              </com:LineTwo>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:LineThree/text()">
              <com:LineThree>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:LineThree"/>
              </com:LineThree>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:LineFour/text()">
              <com:LineFour>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:LineFour"/>
              </com:LineFour>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:CityName/text()">
              <com:CityName>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:CityName"/>
              </com:CityName>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:StateName/text()">
              <com:StateName>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:StateName"/>
              </com:StateName>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:CountyName/text()">
              <com:CountyName>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:CountyName"/>
              </com:CountyName>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:CountryName/text()">
              <com:CountryName>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:CountryName"/>
              </com:CountryName>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:PostalCode/text()">
              <com:PostalCode>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:PostalCode"/>
              </com:PostalCode>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:PreferredIndicator/text()">
              <com:PreferredIndicator>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Address/com:PreferredIndicator"/>
              </com:PreferredIndicator>
            </xsl:if>
          </com:Address>
          <xsl:for-each select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Phone">
            <com:Phone>
              <xsl:if test="com:PhoneType/text()">
                <com:PhoneType>
                  <xsl:value-of select="com:PhoneType"/>
                </com:PhoneType>
              </xsl:if>
              <xsl:choose>
                <xsl:when test="com:CompleteNumber/text()">
                  <xsl:if test="com:CompleteNumber/text()">
                    <com:CompleteNumber>
                      <xsl:value-of select="com:CompleteNumber"/>
                    </com:CompleteNumber>
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:if test="com:CountryCode/text()">
                    <com:CountryCode>
                      <xsl:value-of select="com:CountryCode"/>
                    </com:CountryCode>
                  </xsl:if>
                  <xsl:if test="com:AreaCode/text()">
                    <com:AreaCode>
                      <xsl:value-of select="com:AreaCode"/>
                    </com:AreaCode>
                  </xsl:if>
                  <xsl:if test="com:LocalNumber/text()">
                    <com:LocalNumber>
                      <xsl:value-of select="com:LocalNumber"/>
                    </com:LocalNumber>
                  </xsl:if>
                  <xsl:if test="com:ExtensionNumber/text()">
                    <com:ExtensionNumber>
                      <xsl:value-of select="com:ExtensionNumber"/>
                    </com:ExtensionNumber>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:if test="com:PreferredIndicator/text()">
                <com:PreferredIndicator>
                  <xsl:value-of select="com:PreferredIndicator"/>
                </com:PreferredIndicator>
              </xsl:if>
            </com:Phone>
          </xsl:for-each>
          <xsl:for-each select="/ns0:ESBMsg/ns0:RqData/tns:Customer/com:Email">
            <com:Email>
              <xsl:if test="com:EmailType/text()">
                <com:EmailType>
                  <xsl:value-of select="com:EmailType"/>
                </com:EmailType>
              </xsl:if>
              <xsl:if test="com:EmailAddress/text()">
                <com:EmailAddress>
                  <xsl:value-of select="com:EmailAddress"/>
                </com:EmailAddress>
              </xsl:if>
              <xsl:if test="com:PreferredIndicator/text()">
                <com:PreferredIndicator>
                  <xsl:value-of select="com:PreferredIndicator"/>
                </com:PreferredIndicator>
              </xsl:if>
            </com:Email>
          </xsl:for-each>
          <com:RelationshipManagerName>
            <xsl:value-of select="$accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/bio:Biometric/ns2:Employee/com:FinUserID"/>
          </com:RelationshipManagerName>
        </tns:Customer>
      </tns:RqData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
