<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="Account"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/db/FIN_DB_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="QueryAverageBalanceInput"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU JUN 11 17:42:18 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <soap:Body xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
      <tns:QueryAverageBalanceInput>
        <tns:cifId>
          <xsl:value-of select="/ns0:Account/custeo:Customer/com:CustomerIdentifier/com:CustomerID"/>
        </tns:cifId>
        <tns:eodDate>
          <xsl:value-of select="/ns0:Account/ns0:Period"/>
        </tns:eodDate>
      </tns:QueryAverageBalanceInput>
    </soap:Body>
  </xsl:template>
</xsl:stylesheet>
