<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Daptiv/Adapter/ftp"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper fn xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:nxs="http://xmlns.oracle.com/pcbpel/nxsd"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:adp="http://xmlns.equitybank.co.ke/ESB/PS/Polaris/Adapter/ftp"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/ftp/PRS_FTP_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="AccountEntryPostingReqFileOutput"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Polaris/Adapter/ftp"/>
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
    <!-- <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/adp:AccountEntryPostingReqFileOutput/adp:DataLine">
          <eo:Transfer>
            <com:TransferIdentifier>
              <com:BankID>
                <xsl:value-of select="adp:UnitID"/>
              </com:BankID>
              <com:TransferID/>
            </com:TransferIdentifier>
            <eo:TransferType>
              <xsl:value-of select="adp:TransactionType"/>
            </eo:TransferType>
            <eo:TransferSubType>CI</eo:TransferSubType>
            <eo:TransactionParticulars>
              <xsl:value-of select="adp:TransactionCode"/>
            </eo:TransactionParticulars>
            <com:TransactionReferenceNumber>
              <xsl:value-of select="adp:TransactionRefNo"/>
            </com:TransactionReferenceNumber>
            <eo:TransactionSerialNumber>
              <xsl:value-of select="adp:TxnSeqNumber"/>
            </eo:TransactionSerialNumber>
            <com:Amount>
              <xsl:value-of select="adp:Amount"/>
            </com:Amount>
            <com:ValueDate>
              <xsl:value-of select="adp:ValueDate"/>
            </com:ValueDate>
            <com:Remarks>
              <xsl:value-of select="adp:Narration1"/>
            </com:Remarks>
            <com:PayFromAccount>
              <com:AccountIdentifier>
                <com:AccountID>
                  <xsl:value-of select="adp:AccountNo"/>
                </com:AccountID>
                <com:AccountCurrency/>
              </com:AccountIdentifier>
            </com:PayFromAccount>
            <eo:TransactionType>T</eo:TransactionType>
          </eo:Transfer>
        </xsl:for-each>
      </eo:RsData>
    </eo:ESBMsg>-->
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="fn:distinct-values(/adp:AccountEntryPostingReqFileOutput/adp:DataLine/adp:TransactionRefNo)">
          <xsl:variable name="tranId" select="."/>
          <eo:Transfer>
            <xsl:for-each select="/adp:AccountEntryPostingReqFileOutput/adp:DataLine[adp:TransactionRefNo = $tranId]">
              <com:Transaction>
                <com:AccountIdentifier>
                  <com:BankID>
                    <xsl:value-of select="adp:UnitID"/>
                  </com:BankID>
                  <com:AccountID>
                    <xsl:value-of select="adp:AccountNo"/>
                  </com:AccountID>
                  <com:AccountCurrency>
                    <xsl:value-of select="adp:Currency"/>
                  </com:AccountCurrency>
                </com:AccountIdentifier>
                <com:TransactionType>
                  <xsl:value-of select="adp:TransactionType"/>
                </com:TransactionType>
                <com:TransactionCode>
                  <xsl:value-of select="adp:TransactionCode"/>
                </com:TransactionCode>
                <com:TransactionReferenceNumber>
                  <xsl:value-of select="adp:TransactionRefNo"/>
                </com:TransactionReferenceNumber>
                <com:TransactionDescription><xsl:value-of select="adp:Narration1"/></com:TransactionDescription>
                <com:TransactionAmount>
                <xsl:attribute name="currencyCode"><xsl:value-of select="adp:Currency"/></xsl:attribute>
                  <xsl:value-of select="adp:Amount"/>
                </com:TransactionAmount>
                <com:Remarks>
                  <xsl:value-of select="adp:Narration1"/>
                </com:Remarks>
                <xsl:if test="adp:ValueDate/text()!=''">
                <com:ValueDate>
                  <xsl:value-of select='concat (substring (adp:ValueDate, 1, 4 ), "-", substring(adp:ValueDate, 5.0, 2.0), "-", substring(adp:ValueDate, 7.0, 2.0) )'/>
                </com:ValueDate>
                </xsl:if>
              </com:Transaction>
            </xsl:for-each>
          </eo:Transfer>
        </xsl:for-each>
        <com:Status>
          <com:Code>ESB-00</com:Code>
          <com:Type>SUCCESS</com:Type>
        </com:Status>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
