<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Daptiv/Adapter/ftp"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:nxs="http://xmlns.oracle.com/pcbpel/nxsd"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/Project/V1/ProjectEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/ftp/DPV_FTP_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="ProjectCostFileInput"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Daptiv/Adapter/ftp"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <app:ProjectCostFileInput>
      <app:HeaderLine>
        <app:LineIdentifier>H</app:LineIdentifier>
        <app:FileName>
          <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Project/fileo:File/fileo:FileName"/>
        </app:FileName>
        <app:Date>
          <xsl:value-of select="xp20:format-dateTime(xp20:current-date(),'[Y0001][M01][D01]')"/></app:Date>
      </app:HeaderLine>
      <xsl:for-each select="/eo:ESBMsg/eo:RqData/eo:Project">
        <app:DataLine>
          <app:LineIdentifier>D</app:LineIdentifier>
          
           <xsl:choose>
                <xsl:when test="com:ProjectIdentifier/com:ProjectNumber = ('1','12','14','25','48','87','88','89','91','92','107','108')">
                  <app:ProjectNumber>
                    <xsl:value-of select="concat(com:ProjectIdentifier/com:ProjectNumber,'-Project')"/>
                  </app:ProjectNumber>
                </xsl:when>
                <xsl:otherwise>
                  <app:ProjectNumber>
                    <xsl:value-of select="com:ProjectIdentifier/com:ProjectNumber"/>
                  </app:ProjectNumber>
                </xsl:otherwise>
              </xsl:choose>
              
              
          <!--app:ProjectNumber>
            <xsl:value-of select="com:ProjectIdentifier/com:ProjectNumber"/>
          </app:ProjectNumber-->
          <app:ExpenditureType>
            <xsl:value-of select="eo:ExpenditureType"/>
          </app:ExpenditureType>
          <app:TaskName>
            <xsl:value-of select="eo:TaskName"/>
          </app:TaskName>
          <app:TaskDescription>
            <xsl:value-of select="eo:TaskDescription"/>
          </app:TaskDescription>
          <app:ExpenditureItemDate>
            <xsl:value-of select="eo:ExpenditureDate"/>
          </app:ExpenditureItemDate>
          <app:Supplier>
            <xsl:value-of select="eo:SupplierName"/>
          </app:Supplier>
          <app:TransactionID>
            <xsl:value-of select="eo:TransactionID"/>
          </app:TransactionID>
          <app:InvoiceNumber>
            <xsl:value-of select="eo:InvoiceNumber"/>
          </app:InvoiceNumber>
          <app:ItemDescription>
            <xsl:value-of select="eo:ExpenditureDescription"/>
          </app:ItemDescription>
          <app:TransactionAmt>
            <xsl:value-of select="eo:TransactionAmount"/>
          </app:TransactionAmt>
          <app:TransCurrencyCode>
            <xsl:value-of select="eo:TransactionAmount/@currencyCode"/>
          </app:TransCurrencyCode>
          <app:AccountedAmount>
            <xsl:value-of select="eo:AccountedAmount"/>
          </app:AccountedAmount>
          <app:ProjectCurrencyCode>
            <xsl:value-of select="eo:ProjectAmount/@currencyCode"/>
          </app:ProjectCurrencyCode>
          <app:ProjectAmount>
            <xsl:value-of select="eo:ProjectAmount"/>
          </app:ProjectAmount>
          <app:PONumber>
            <xsl:value-of select="eo:PONumber"/>
          </app:PONumber>
          <app:Project_ID>
            <xsl:value-of select="com:ProjectIdentifier/com:ProjectID"/>
          </app:Project_ID>
        </app:DataLine>
      </xsl:for-each>
      <app:TrailerLine>
        <app:LineIdentifier>T</app:LineIdentifier>
        <app:NumberOfRows>
          <xsl:value-of select="count(/eo:ESBMsg/eo:RqData/eo:Project)"/>
        </app:NumberOfRows>
      </app:TrailerLine>
    </app:ProjectCostFileInput>
  </xsl:template>
</xsl:stylesheet>
