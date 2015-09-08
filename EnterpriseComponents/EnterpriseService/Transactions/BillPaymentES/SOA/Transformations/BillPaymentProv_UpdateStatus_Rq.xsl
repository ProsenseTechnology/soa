<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns0="http://xmlns.oracle.com/EnterpriseService_Transactions/BillPaymentES/NotifyBill"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/top/StagingDB"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns1="http://xmlns.oracle.com/EnterpriseService.Transactions/BillPaymentES/BillPaymentProvRouter"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/EnterpriseService.Transactions/BillPaymentES/StagingDB"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/BillPaymentProvRouter.wsdl"/>
        <oracle-xsl-mapper:rootElement name="NotifyBillRequest"
                                       namespace="http://xmlns.oracle.com/EnterpriseService_Transactions/BillPaymentES/NotifyBill"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/StagingDB.wsdl"/>
        <oracle-xsl-mapper:rootElement name="CustMasterTranTableCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/StagingDB"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU APR 30 15:58:37 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:CustMasterTranTableCollection>
      <xsl:for-each select="/ns0:NotifyBillRequest/ns0:Payments">
        <tns:CustMasterTranTable>
          <tns:status>
            <xsl:value-of select="ns0:status"/>
          </tns:status>
          <tns:id>
            <xsl:value-of select="ns0:id"/>
          </tns:id>
        </tns:CustMasterTranTable>
      </xsl:for-each>
    </tns:CustMasterTranTableCollection>
  </xsl:template>
</xsl:stylesheet>