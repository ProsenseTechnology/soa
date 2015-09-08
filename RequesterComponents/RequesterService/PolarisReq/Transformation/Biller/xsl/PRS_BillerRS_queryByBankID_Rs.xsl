<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Biller/V1"
                xmlns:v1="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Biller/V1"
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
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app custeo v13 v12 v1 v11 oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Biller/V1/BillerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Biller/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Biller/V1/BillerRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Biller/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <v1:ESBMsg>
      <v11:MsgID>
        <xsl:value-of select="/v13:ESBMsg/v12:MsgID"/>
      </v11:MsgID>
      <xsl:if test="/v13:ESBMsg/v13:RsData">
        <v1:RsData>
          <xsl:for-each select="/v13:ESBMsg/v13:RsData/v13:Biller">
            <xsl:if test=".">
              <v1:Biller>
                <xsl:if test="v12:BillerIdentifier">
                  <v12:BillerIdentifier>
                    <xsl:if test="v12:BillerIdentifier/v12:BankID">
                      <v12:BankID>
                        <xsl:value-of select="v12:BillerIdentifier/v12:BankID"/>
                      </v12:BankID>
                    </xsl:if>
                    <xsl:if test="v12:BillerIdentifier/v12:BankBIC">
                      <v12:BankBIC>
                        <xsl:value-of select="v12:BillerIdentifier/v12:BankBIC"/>
                      </v12:BankBIC>
                    </xsl:if>
                    <xsl:if test="v12:BillerIdentifier/v12:BranchID">
                      <v12:BranchID>
                        <xsl:value-of select="v12:BillerIdentifier/v12:BranchID"/>
                      </v12:BranchID>
                    </xsl:if>
                    <xsl:if test="v12:BillerIdentifier/v12:AccountID">
                      <v12:AccountID>
                        <xsl:value-of select="v12:BillerIdentifier/v12:AccountID"/>
                      </v12:AccountID>
                    </xsl:if>
                    <xsl:if test="v12:BillerIdentifier/v12:AccountCurrency">
                      <v12:AccountCurrency>
                        <xsl:value-of select="v12:BillerIdentifier/v12:AccountCurrency"/>
                      </v12:AccountCurrency>
                    </xsl:if>
                    <xsl:if test="v12:BillerIdentifier/v12:BillerCode">
                      <v12:BillerID>
                        <xsl:value-of select="v12:BillerIdentifier/v12:BillerCode"/>
                      </v12:BillerID>
                    </xsl:if>
                  </v12:BillerIdentifier>
                </xsl:if>
                <xsl:if test="v13:BillerType">
                  <v13:BillerType>
                    <xsl:value-of select="v13:BillerType"/>
                  </v13:BillerType>
                </xsl:if>
                <xsl:if test="v13:BillerName">
                  <v13:BillerName>
                    <xsl:value-of select="v13:BillerName"/>
                  </v13:BillerName>
                </xsl:if>
                <xsl:if test="v12:ValType">
                  <v12:ValType>
                    <xsl:value-of select="v12:ValType"/>
                  </v12:ValType>
                </xsl:if>
                <xsl:if test="v13:BillerStatus">
                  <v13:BillerStatus>
                    <xsl:value-of select="v13:BillerStatus"/>
                  </v13:BillerStatus>
                </xsl:if>
              </v1:Biller>
            </xsl:if>
          </xsl:for-each>
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