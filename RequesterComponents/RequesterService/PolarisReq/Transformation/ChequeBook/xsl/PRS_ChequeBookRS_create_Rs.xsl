<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/ChequeBook/V1"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:v1="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/ChequeBook/V1"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd v13 v1 v12 oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:v12="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:v11="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Instruments/ChequeBook/V1/ChequeBookEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/ChequeBook/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/ChequeBook/V1/ChequeBookRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/ChequeBook/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [WED APR 29 19:35:54 PDT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <v1:ESBMsg>
      <v11:MsgID>
        <xsl:value-of select="/v13:ESBMsg/v12:MsgID"/>
      </v11:MsgID>
      <xsl:if test="/v13:ESBMsg/v13:RsData">
        <v1:RsData>
          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook">
            <v1:ChequeBook>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier">
                <v12:ChequeBookIdentifier>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:BankID">
                    <v12:BankID>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:BankID"/>
                    </v12:BankID>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:BankBIC">
                    <v12:BankBIC>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:BankBIC"/>
                    </v12:BankBIC>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:BranchID">
                    <v12:BranchID>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:BranchID"/>
                    </v12:BranchID>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:AccountID">
                    <v12:AccountID>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:AccountID"/>
                    </v12:AccountID>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:AccountCurrency">
                    <v12:AccountCurrency>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:ChequeBookIdentifier/v12:AccountCurrency"/>
                    </v12:AccountCurrency>
                  </xsl:if>
                </v12:ChequeBookIdentifier>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:ChequeBookType">
                <v13:ChequeBookType>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:ChequeBookType"/>
                </v13:ChequeBookType>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:NoOfChequeBook">
                <v13:NoOfChequeBook>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:NoOfChequeBook"/>
                </v13:NoOfChequeBook>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:NoOfLeaves">
                <v12:NoOfLeaves>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v12:NoOfLeaves"/>
                </v12:NoOfLeaves>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:BeginChequeNumber">
                <v13:BeginChequeNumber>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:BeginChequeNumber"/>
                </v13:BeginChequeNumber>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:EndChequeNumber">
                <v13:EndChequeNumber>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:EndChequeNumber"/>
                </v13:EndChequeNumber>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:ChequeBookStatus">
                <v13:ChequeBookStatus>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:ChequeBook/v13:ChequeBookStatus"/>
                </v13:ChequeBookStatus>
              </xsl:if>
            </v1:ChequeBook>
          </xsl:if>
          <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status">
            <v12:Status>
              <xsl:choose>
                <xsl:when test="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type='SUCCESS'">
                  <v12:Code>ESB-00</v12:Code>
                </xsl:when>
                <xsl:otherwise>
                  <v12:Code>ESB-100</v12:Code>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type">
                <v12:Type>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type"/>
                </v12:Type>
              </xsl:if>
              <v12:Text>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Text"/>
              </v12:Text>
            </v12:Status>
          </xsl:if>
        </v1:RsData>
      </xsl:if>
    </v1:ESBMsg>
  </xsl:template>
</xsl:stylesheet>