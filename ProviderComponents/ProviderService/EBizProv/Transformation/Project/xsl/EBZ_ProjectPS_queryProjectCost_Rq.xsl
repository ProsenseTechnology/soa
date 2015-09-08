<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com xp20 DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/EBiz/Adapter/db" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1" xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/Project/V1/ProjectEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/db/EBZ_DB_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="QueryProjectCostInput" namespace="http://xmlns.equitybank.co.ke/ESB/PS/EBiz/Adapter/db"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <app:QueryProjectCostInput>
      <app:startDate>
        <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Project/com:StartDate,'[D01]-[MNn,3-3]-[Y01]')"/>
      </app:startDate>
      <app:endDate>
        <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Project/com:EndDate,'[D01]-[MNn,3-3]-[Y01]')"/>
      </app:endDate>
    </app:QueryProjectCostInput>
  </xsl:template>
</xsl:stylesheet>