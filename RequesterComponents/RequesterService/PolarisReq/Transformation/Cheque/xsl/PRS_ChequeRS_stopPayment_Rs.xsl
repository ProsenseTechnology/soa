<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Cheque/V1"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:v1="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Cheque/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl v13 v1 oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:v12="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:v11="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
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
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI JUN 19 11:22:06 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="EndChequeNum"/>
  <xsl:param name="StartChequeNum"/>
  <xsl:param name="BankID"/>
  <xsl:template match="/">
    <v1:ESBMsg>
      <v11:MsgID>
        <xsl:value-of select="/v13:ESBMsg/v12:MsgID"/>
      </v11:MsgID>
      <v1:RsData>
        <xsl:for-each select="/v13:ESBMsg/v13:RsData/v13:Cheque">
          <v1:Cheque>
            <v12:ChequeIdentifier>
              <v12:ChequeID>
                <xsl:value-of select="v13:BeginChequeNumber"/>
              </v12:ChequeID>
            </v12:ChequeIdentifier>
            <xsl:choose>
              <xsl:when test="v13:ChequeStatus=''">
                <v1:ChequeStatus>
                  <xsl:value-of select="v13:FailureReasonCode"/>
                </v1:ChequeStatus>
              </xsl:when>
              <xsl:otherwise>
                <v1:ChequeStatus>
                  <xsl:value-of select="v13:ChequeStatus"/>
                </v1:ChequeStatus>
              </xsl:otherwise>
            </xsl:choose>
          </v1:Cheque>
        </xsl:for-each>
        <xsl:choose>
          <xsl:when test="number (number ($StartChequeNum ) > number ($EndChequeNum ) )">
            <v12:Status>
              <v12:Code>ESB-100</v12:Code>
              <v12:Type>FAILURE</v12:Type>
              <v12:Text>NO DATA FOUND</v12:Text>
            </v12:Status>
          </xsl:when>
          <xsl:when test="$BankID !='54' or '56' or '55' or '11' or '50'">
            <v12:Status>
              <v12:Code>ESB-100</v12:Code>
              <v12:Type>FAILURE</v12:Type>
              <v12:Text>Wrong BankID</v12:Text>
            </v12:Status>
          </xsl:when>
          <xsl:otherwise>
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
          </xsl:otherwise>
        </xsl:choose>
      </v1:RsData>
    </v1:ESBMsg>
  </xsl:template>
</xsl:stylesheet>