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
        <oracle-xsl-mapper:rootElement name="UpdateProjectInput" namespace="http://xmlns.equitybank.co.ke/ESB/PS/EBiz/Adapter/apps"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <app:UpdateProjectInput>
      <app:V_PROJECT_LIST>
        <xsl:for-each select="/eo:ESBMsg/eo:RqData/eo:Project">
          <app:V_PROJECT_LIST_ITEM>
            <app:PROJECT_NUMBER>
              <xsl:value-of select="com:ProjectIdentifier/com:ProjectNumber"/>
            </app:PROJECT_NUMBER>
            <app:TRANS_ID>
              <xsl:value-of select="eo:TransactionID"/>
            </app:TRANS_ID>
            <app:TRANS_DATE>
              <xsl:value-of select="eo:ExpenditureDate"/>
            </app:TRANS_DATE>
            <app:TARGET_SYSTEM>
              <xsl:value-of select="/eo:ESBMsg/com:Source"/>
            </app:TARGET_SYSTEM>
          </app:V_PROJECT_LIST_ITEM>
        </xsl:for-each>
      </app:V_PROJECT_LIST>
    </app:UpdateProjectInput>
  </xsl:template>
</xsl:stylesheet>