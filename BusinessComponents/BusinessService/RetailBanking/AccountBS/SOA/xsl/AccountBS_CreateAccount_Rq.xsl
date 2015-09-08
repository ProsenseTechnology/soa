<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
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
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
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
      <tns:RqData actionCode="$actionCodeVar">
        <xsl:choose>
          <xsl:when test="/ns0:ESBMsg/ns0:RqData/tns:Account/tns:AccountType/text()='SBA'">
            <xsl:attribute name="actionCode">CreateSBAccount</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="actionCode">CreateCAAccount</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:for-each select="/ns0:ESBMsg/ns0:RqData/tns:Account">
          <tns:Account>
            <com:AccountIdentifier>
              <com:BankID>
                <xsl:value-of select="$accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/bio:Biometric/com:CustomerIdentifier/com:BankID"/>
              </com:BankID>
              <com:BranchID>
                <xsl:value-of select="$accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/bio:Biometric/com:CustomerIdentifier/com:BranchID"/>
              </com:BranchID>
              <com:AccountCurrency>
                <xsl:value-of select="com:AccountIdentifier/com:AccountCurrency"/>
              </com:AccountCurrency>
            </com:AccountIdentifier>
            <tns:AccountType>
              <xsl:value-of select="tns:AccountType"/>
            </tns:AccountType>
            <tns:AccountSubType>
              <xsl:value-of select="tns:AccountSubType"/>
            </tns:AccountSubType>
            <tns:AccountStmtCode>
              <xsl:value-of select="tns:AccountStmtCode"/>
            </tns:AccountStmtCode>
            <tns:StatementFrequency>
              <tns:CalenderType>
                <xsl:value-of select="tns:StatementFrequency/tns:CalenderType"/>
              </tns:CalenderType>
              <tns:StmtDuration>
                <xsl:value-of select="tns:StatementFrequency/tns:StmtDuration"/>
              </tns:StmtDuration>
              <tns:StartDay>
                <xsl:value-of select="tns:StatementFrequency/tns:StartDay"/>
              </tns:StartDay>
              <tns:WeekDay>
                <xsl:value-of select="tns:StatementFrequency/tns:WeekDay"/>
              </tns:WeekDay>
              <tns:WeekNum>
                <xsl:value-of select="tns:StatementFrequency/tns:WeekNum"/>
              </tns:WeekNum>
              <tns:HolidaytStatus>
                <xsl:value-of select="tns:StatementFrequency/tns:HolidaytStatus"/>
              </tns:HolidaytStatus>
            </tns:StatementFrequency>
            <tns:AccountDespatchCode>
              <xsl:value-of select="tns:AccountDespatchCode"/>
            </tns:AccountDespatchCode>
            <custeo:Customer>
              <com:CustomerIdentifier>
                <com:CustomerID>
                  <xsl:value-of select="$accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/custeo:Customer/com:CustomerIdentifier/com:CustomerID"/>
                </com:CustomerID>
              </com:CustomerIdentifier>
              <com:Person>
                <com:PersonName>
                  <com:FullName>
                    <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:PersonName/com:FullName"/>
                  </com:FullName>
                  <com:FirstName>
                    <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:PersonName/com:FirstName"/>
                  </com:FirstName>
                  <com:MiddleName>
                    <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:PersonName/com:MiddleName"/>
                  </com:MiddleName>
                  <com:LastName>
                    <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:PersonName/com:LastName"/>
                  </com:LastName>
                  <com:Title>
                    <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:PersonName/com:Title"/>
                  </com:Title>
                </com:PersonName>
                <com:FaceImage>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:FaceImage"/>
                </com:FaceImage>
                <com:IdentityDocument>
                  <com:IdentityDocumentID>
                    <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentID"/>
                  </com:IdentityDocumentID>
                  <com:DocImage1>
                    <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:IdentityDocument/com:DocImage1"/>
                  </com:DocImage1>
                  <com:DocImage2>
                    <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:IdentityDocument/com:DocImage2"/>
                  </com:DocImage2>
                </com:IdentityDocument>
                <com:SignatureImage>
                  <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:SignatureImage"/>
                </com:SignatureImage>
              </com:Person>
            </custeo:Customer>
            <com:RelationshipManagerName>
              <xsl:value-of select="$accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/bio:Biometric/com:BiometricIdentifier/com:BiometricID"/>
            </com:RelationshipManagerName>
            <xsl:if test="tns:JijengeAccount">
              <tns:JijengeAccount>
                <xsl:if test="tns:JijengeAccount/tns:InstallmentAmount">
                  <tns:InstallmentAmount>
                    <xsl:if test="tns:JijengeAccount/tns:InstallmentAmount/@currencyCode">
                      <xsl:attribute name="currencyCode">
                        <xsl:value-of select="tns:JijengeAccount/tns:InstallmentAmount/@currencyCode"/>
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="tns:JijengeAccount/tns:InstallmentAmount"/>
                  </tns:InstallmentAmount>
                </xsl:if>
                <xsl:if test="tns:JijengeAccount/tns:InstallmentPeriod">
                  <tns:InstallmentPeriod>
                    <xsl:value-of select="tns:JijengeAccount/tns:InstallmentPeriod"/>
                  </tns:InstallmentPeriod>
                </xsl:if>
              </tns:JijengeAccount>
            </xsl:if>
          </tns:Account>
        </xsl:for-each>
      </tns:RqData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
