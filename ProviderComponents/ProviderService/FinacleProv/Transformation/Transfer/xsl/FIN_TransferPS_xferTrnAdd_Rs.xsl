<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="ForEachFiXml" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:RequestMessageKey/app:RequestUUID"/>
      </com:MsgID>
      <eo:RsData>
        <xsl:choose>
          <xsl:when test="/app:ForEachFiXml/app:FIXML">
            <xsl:for-each select="/app:ForEachFiXml/app:FIXML">
              <eo:Transfer>
                <com:TransferIdentifier>
                  <com:BankID>
                    <xsl:value-of select="app:Header/app:ResponseHeader/app:ResponseMessageInfo/app:BankId"/>
                  </com:BankID>
                  <com:TransferID>
                    <xsl:value-of select="app:Body/app:XferTrnAddResponse/app:XferTrnAddRs/app:TrnIdentifier/app:TrnId"/>
                  </com:TransferID>
                </com:TransferIdentifier>
                <xsl:choose>
                  <xsl:when test="count(app:Body/app:Error ) &lt;= 0">
                    <eo:TransferStatus>
                      <xsl:value-of select="app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
                    </eo:TransferStatus>
                  </xsl:when>
                  <xsl:when test="count(app:Body/app:Error/app:FIBusinessException ) > 0">
                    <eo:TransferStatus>
                      <xsl:value-of select="app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorDesc"/>
                    </eo:TransferStatus>
                  </xsl:when>
                  <xsl:otherwise>
                    <eo:TransferStatus>
                      <xsl:value-of select="app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorDesc"/>
                    </eo:TransferStatus>
                  </xsl:otherwise>
                </xsl:choose>
              </eo:Transfer>
            </xsl:for-each>
          </xsl:when>
          <!-- WIll be remocved In Future -->
          <xsl:otherwise>
            <eo:Transfer>
              <com:TransferIdentifier>
                <com:BankID>
                  <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:ResponseMessageInfo/app:BankId"/>
                </com:BankID>
                <com:TransferID>
                  <xsl:value-of select="/app:FIXML/app:Body/app:XferTrnAddResponse/app:XferTrnAddRs/app:TrnIdentifier/app:TrnId"/>
                </com:TransferID>
              </com:TransferIdentifier>
              <xsl:choose>
                <xsl:when test="count(/app:FIXML/app:Body/app:Error ) &lt;= 0">
                  <eo:TransferStatus>
                    <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
                  </eo:TransferStatus>
                </xsl:when>
                <xsl:when test="count(/app:FIXML/app:Body/app:Error/app:FIBusinessException ) > 0">
                  <eo:TransferStatus>
                    <xsl:value-of select="/app:FIXML/app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorDesc"/>
                  </eo:TransferStatus>
                </xsl:when>
                <xsl:otherwise>
                  <eo:TransferStatus>
                    <xsl:value-of select="/app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorDesc"/>
                  </eo:TransferStatus>
                </xsl:otherwise>
              </xsl:choose>
            </eo:Transfer>
          </xsl:otherwise>
          <!-- WIll be removed In Future -->
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="/app:ForEachFiXml/app:FIXML">
            <com:Status>
              <xsl:choose>
                <xsl:when test="/app:ForEachFiXml/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction[app:Status ='SUCCESS']">
                  <com:Code>ESB-00</com:Code>
                </xsl:when>
                <xsl:otherwise>
                  <com:Code>ESB-100</com:Code>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="/app:ForEachFiXml/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction[app:Status ='SUCCESS']">
                  <com:Type>Success</com:Type>
                </xsl:when>
                <xsl:otherwise>
                  <com:Type>Failure</com:Type>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="/app:ForEachFiXml/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction[app:Status ='SUCCESS']">
                  <com:Text>Request Initiated Succesfully</com:Text>
                </xsl:when>
                <xsl:otherwise>
                  <com:Text>Request UnSuccesfull</com:Text>
                </xsl:otherwise>
              </xsl:choose>
            </com:Status>
          </xsl:when>
          <!-- WIll be remocved In Future -->
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="count (/app:FIXML/app:Body/app:Error ) &lt;= 0">
                <com:Status>
                  <com:Code>ESB-00</com:Code>
                  <com:Type>
                    <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
                  </com:Type>
                  <com:Text>Transfers funds processed successfully</com:Text>
                </com:Status>
              </xsl:when>
              <xsl:otherwise>
                <com:Status>
                  <com:Code>ESB-100</com:Code>
                  <com:Type>
                    <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:HostTransaction/app:Status"/>
                  </com:Type>
                  <xsl:choose>
                    <xsl:when test="count (/app:FIXML/app:Body/app:Error/app:FIBusinessException ) > 0">
                      <com:Text>
                        <xsl:value-of select="concat ('ErrorCode ', /app:FIXML/app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorCode, ',  ErrorDesc ', /app:FIXML/app:Body/app:Error/app:FIBusinessException/app:ErrorDetail/app:ErrorDesc )"/>
                      </com:Text>
                    </xsl:when>
                    <xsl:otherwise>
                      <com:Text>
                        <xsl:value-of select="concat ('ErrorCode ', /app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorCode, ',  ErrorDesc ', /app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorDesc )"/>
                      </com:Text>
                    </xsl:otherwise>
                  </xsl:choose>
                </com:Status>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
          <!-- WIll be remocved In Future -->
        </xsl:choose>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>