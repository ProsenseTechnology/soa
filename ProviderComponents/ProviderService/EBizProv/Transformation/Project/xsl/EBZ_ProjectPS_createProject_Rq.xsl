<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/EBiz/Adapter/apps" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1" xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/Project/V1/ProjectEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/apps/EBZ_Apps_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="CreateProjectInput" namespace="http://xmlns.equitybank.co.ke/ESB/PS/EBiz/Adapter/apps"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <app:CreateProjectInput>
      <app:V_PROJECT_NUMBER>
        <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Project/com:ProjectIdentifier/com:ProjectNumber"/>
      </app:V_PROJECT_NUMBER>
      <app:V_PROJECT_NAME>
        <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Project/eo:ProjectName"/>
      </app:V_PROJECT_NAME>
      <app:V_PROJECT_DESCRIPTION>
        <xsl:value-of select="substring (/eo:ESBMsg/eo:RqData/eo:Project/eo:ProjectDescription, 1, 250 )"/>
      </app:V_PROJECT_DESCRIPTION>
      <app:V_PROJECT_TEMPLATE>
        <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Project/com:TemplateName"/>
      </app:V_PROJECT_TEMPLATE>
      <app:V_START_DATE>
        <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Project/com:StartDate"/>
      </app:V_START_DATE>
      <app:V_END_DATE>
        <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Project/com:EndDate"/>
      </app:V_END_DATE>
      <app:V_ORG_NAME>
        <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Project/com:OrganizationName"/>
      </app:V_ORG_NAME>
    </app:CreateProjectInput>
  </xsl:template>
</xsl:stylesheet>